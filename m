Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2456FCE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:20:01 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7PIK07h015313; Mon, 25 Aug 2014 13:20:00 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082513200020-363532 ;
	Mon, 25 Aug 2014 13:20:00 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1408792274.5457.18.camel@ted>
References: <cover.1408742574.git.rich.tollerton@ni.com>
	<7db18f933460f111085749ee49a70796eab4068a.1408742574.git.rich.tollerton@ni.com>
	<1408792274.5457.18.camel@ted>
User-Agent: Notmuch/0.18.1 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-unknown-linux-gnu)
Date: Mon, 25 Aug 2014 13:20:00 -0500
Message-ID: <87zjeso2i7.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/25/2014 01:20:00 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/25/2014 01:20:00 PM,
	Serialize complete at 08/25/2014 01:20:00 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-25_05:2014-08-25, 2014-08-25,
	1970-01-01 signatures=0
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 09/12] udev-cache: get system config immediately before cache
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Aug 2014 18:20:08 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> The above reason c) is also why we don't use cmp. It turned out to be
> faster to read into a variable than fork/exec cmp.

You appear to be wrong: cat+cmp is 27-41% faster than readfiles. In
fact, testing cat alone (without cmp) shows that `cat` to tmpfs file is
2x-3x as fast as readfiles.

These figures reproduce on both a Xilinx Zynq Cortex-A9 and my Xeon dev
machine; the former running busybox sh, the latter running bash.

See below for test script.

---

#!/bin/busybox sh

files="/proc/version /proc/cmdline /proc/devices"
runs=100

readfiles () {
   READDATA=""
   for filename in $@; do
	   if [ -r $filename ]; then
		   while read line; do
			   READDATA="$READDATA$line"
		   done < $filename
	   fi
   done
}

dotest_cat_inner () {
	cat $@
}

dotest_cat () {
	cat $@ > /tmp/a.txt
	cat $@ > /tmp/b.txt
	cmp /tmp/a.txt /tmp/b.txt
}

dotest_readfiles_inner () {
	readfiles $@
	echo "$READDATA"
}

dotest_readfiles () {
	readfiles $@
	NEWDATA="$READDATA"
	readfiles $@
	OLDDATA="$OLDDATA"
	[ "$OLDDATA" = "$NEWDATA" ]
}

timetest () {
	cmd=$1
	i=$2
	shift 2
	while [ "$i" -gt 0 ]; do
		$cmd $@ >/dev/null
		i=$(( i-1 ))
	done
}

case $1 in
cat) timetest dotest_cat $runs $files ;;
readfiles) timetest dotest_readfiles $runs $files ;;
inner_cat) timetest dotest_cat_inner $runs $files ;;
inner_readfiles) timetest dotest_readfiles_inner $runs $files ;;
*) 
	printf 'cat:\n'
	time $0 cat

	printf '\nreadfiles:\n'
	time $0 readfiles

	printf '\ncat_inner:\n'
	time $0 inner_cat

	printf '\nreadfiles_inner:\n'
	time $0 inner_readfiles
	;;
esac


> Cheers,
>
> Richard
>

-- 
Richard Tollerton <rich.tollerton@ni.com>


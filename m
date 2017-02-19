Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA6C960079
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 18:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JIl9T1020655; Sun, 19 Feb 2017 18:47:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q6qzyYwL2PTS; Sun, 19 Feb 2017 18:47:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JIl2vL020639
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Feb 2017 18:47:06 GMT
Message-ID: <1487530021.30548.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Sun, 19 Feb 2017 10:47:01 -0800
In-Reply-To: <1487316357.13854.504.camel@intel.com>
References: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
	<1487316357.13854.504.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Sun, 19 Feb 2017 18:47:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-17 at 08:25 +0100, Patrick Ohly wrote:
> On Thu, 2017-02-16 at 15:46 -0800, Saul Wold wrote:
> > 
> > This allows a native package's recipe-sysroot-native to be
> > populated with
> > that packages native image files.  This in turns allows it to be
> > used by
> > scripts or other tools without creating un-necessary DEPENDS.
> > 
> > An example of this is systemtap-native and the crosstap script.
> The intended usage wasn't clear to me at first. I think it is
> something
> like "bitbake foobar-native" and then calling foobar's tools directly
> from tmp/work/*/foobar-native/*/recipe-sysroot-native (?).
> 
> If true, then any recipe intending to be used like that also needs to
> exclude itself from do_rm_work:
> RM_WORK_EXCLUDE += "${PN}"
> 
> Or perhaps more selectively exclude the RSS:
> RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native" (is there a variable
> for this name?)

I've been idly wondering whether just excluding recipe-sysroot* from
rm_work might be useful since its mostly hardlinked files anyway and
likely doesn't cause too much of a space issue...

Cheers,

Richard


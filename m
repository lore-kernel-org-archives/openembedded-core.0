Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 88CCD731F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 10:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BACgDQ019097; Thu, 11 Feb 2016 10:12:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D5rCmlJDSb-7; Thu, 11 Feb 2016 10:12:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BACdth019091
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Feb 2016 10:12:40 GMT
Message-ID: <1455185559.16142.244.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 10:12:39 +0000
In-Reply-To: <216ce45325c2608c2f9b1fece5dee005e6ee2ba7.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
	<216ce45325c2608c2f9b1fece5dee005e6ee2ba7.1455126045.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/9] ltp: Upgrade to 20160126 and fix build on musl
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
X-List-Received-Date: Thu, 11 Feb 2016 10:12:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I tested this in master-next on the AB, it fails for
"MACHINE=edgerouter bitbake ltp":

| 1455184833.52:                                             ^
| 1455184833.52: In file included from /media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm/types.h:22:0,
| 1455184833.52:                  from /media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/linux/types.h:4,
| 1455184833.52:                  from /media/build1/poky/build/tmp/work/mips64-poky-linux/ltp/20160126-r0/git/utils/sctp/testlib/../include/netinet/sctp.h:37,
| 1455184833.52:                  from sctputil.c:55:
| 1455184833.52: /media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm-generic/int-l64.h:28:25: note: previous declaration of '__s64' was here
| 1455184833.52:  typedef __signed__ long __s64;
| 1455184833.52:                          ^
| 1455184833.52: In file included from /media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm-generic/types.h:6:0,
| 1455184833.52:                  from /media/build1/poky/build/tmp/work/mips64-poky-linux/ltp/20160126-r0/git/utils/sctp/testlib/../include/netinet/sctp.h:38,
| 1455184833.52:                  from sctputil.c:55:
| 1455184833.52: /media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm-generic/int-ll64.h:30:42: error: conflicting types for '__u64'
| 1455184833.52:  __extension__ typedef unsigned long long __u64;
| 1455184833.52:                                           ^

also did so locally.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C80AB6CBAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 12:24:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GCOGDQ029172; Wed, 16 Oct 2013 13:24:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CrTEkn74VZvx; Wed, 16 Oct 2013 13:24:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GCOC14029166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 16 Oct 2013 13:24:14 +0100
Message-ID: <1381926249.29912.465.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 16 Oct 2013 13:24:09 +0100
In-Reply-To: <4C04C210-DFEA-46BB-B322-9EB80ED0E0B5@dominion.thruhere.net>
References: <1381875766-20689-1-git-send-email-sgw@linux.intel.com>
	<1517941.hq8ryEHxA8@helios>
	<8BAC7D9C-A794-42B2-B31A-9FDC3AEB9FDC@dominion.thruhere.net>
	<1578419.2XPu0WXrbc@helios>
	<4C04C210-DFEA-46BB-B322-9EB80ED0E0B5@dominion.thruhere.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-basic: libuser has a hard depenency on libpam
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
X-List-Received-Date: Wed, 16 Oct 2013 12:24:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 14:21 +0200, Koen Kooi wrote:
> Op 16 okt. 2013, om 13:47 heeft Paul Eggleton <paul.eggleton@linux.intel.com> het volgende geschreven:
> 
> > On Wednesday 16 October 2013 13:23:08 Koen Kooi wrote:
> >> Op 16 okt. 2013, om 12:25 heeft Paul Eggleton
> >> <paul.eggleton@linux.intel.com> het volgende geschreven:
> >>> On Tuesday 15 October 2013 15:22:46 Saul Wold wrote:
> >>>> Since libpam is only built when DISTRO_FEATURES pam is enabled we should
> >>>> not be trying to build libuser also.
> >>> 
> >>> Should this packagegroup be bringing in libraries such as this at all,
> >>> given that libraries are generally pulled in as dependencies of
> >>> applications that link to them?
> >> 
> >> If it is a pure library, no. But libuser doesn't seem to be a pure library
> >> package:
> >> 
> >> [koen@rrMBP libuser]$ cat libuser/latest
> >> PV = 0.58
> >> PR = r0
> >> PKGR = r0.0
> >> RPROVIDES =
> >> RDEPENDS = eglibc (>= 2.17) glib-2.0 (>= 2.34.3) libffi (>= 3.0.11) libpam
> >> (>= 1.1.6) popt (>= 1.16) RRECOMMENDS =
> >> PKGSIZE = 283679
> >> FILES = /usr/bin/* /usr/sbin/* /usr/lib/libuser/* /usr/lib/lib*.so.* /etc
> >> /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d
> >> /usr/lib/udev/rules.d /usr/share/libuser /usr/lib/libuser/*
> >> /usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf
> >> /usr/share/sounds /usr/lib/bonobo/servers FILELIST = /etc/libuser.conf
> >> /usr/bin/lchfn /usr/bin/lchsh /usr/lib/libuser.so.1
> >> /usr/lib/libuser.so.1.4.0 /usr/lib/libuser/libuser_files.so
> >> /usr/lib/libuser/libuser_shadow.so /usr/sbin/lchage /usr/sbin/lgroupadd
> >> /usr/sbin/lgroupdel /usr/sbin/lgroupmod /usr/sbin/lid /usr/sbin/lnewusers
> >> /usr/sbin/lpasswd /usr/sbin/luseradd /usr/sbin/luserdel /usr/sbin/lusermod
> > 
> > Right, in that case, ignore me :)
> 
> But I still don't know what it does and why it needs to be in packagegroup-core-basic, though.

Looks like it has a number of pam user tools (groupadd, useradd and so
on) and this goes with the other contents of
packagegroup-core-multiuser...

Cheers,

Richard



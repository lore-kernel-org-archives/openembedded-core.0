Return-Path: <preid@electromag.com.au>
Received: from anchovy.45ru.net.au (anchovy3.45ru.net.au [203.30.46.155])
	by mail.openembedded.org (Postfix) with ESMTP id 78BAB60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 03:10:44 +0000 (UTC)
Received: (qmail 10562 invoked by uid 5089); 18 Jan 2016 03:10:43 -0000
Received: by simscan 1.2.0 ppid: 10518, pid: 10519, t: 0.0392s
	scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.122?)
	(preid@electromag.com.au@203.59.230.133)
	by anchovy3.45ru.net.au with ESMTPA; 18 Jan 2016 03:10:43 -0000
To: Christopher Larson <clarson@kergoth.com>,
	Max Krummenacher <max.oss.09@gmail.com>
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
	<1448017370.2788.16.camel@Saturn.local.all>
	<CABcZANnHb700FZynO=aTXmzcJ-1k2S_v7hWXDGeL96mc427kJg@mail.gmail.com>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <569C57B1.2070309@electromag.com.au>
Date: Mon, 18 Jan 2016 11:10:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CABcZANnHb700FZynO=aTXmzcJ-1k2S_v7hWXDGeL96mc427kJg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Lots of [host-user-contaminated] warning
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
X-List-Received-Date: Mon, 18 Jan 2016 03:10:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 18/01/2016 10:55 AM, Christopher Larson wrote:
>
> On Fri, Nov 20, 2015 at 4:02 AM, Max Krummenacher <max.oss.09@gmail.com <mailto:max.oss.09@gmail.com>> wrote:
>
>     Am Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas Müller:
>     > Hi,
>     >
>     > this bugs me for a while and I wonder if I am again the only one
>     > facing this: I get floods of warnings for sourcecode files as
>     >
>     > WARNING: QA Issue: qtserialport:
>     > /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1
>     +gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
>     > is owned by uid 1000, which is the same as the user running bitbake.
>     > This may be due to host contamination [host-user-contaminated]
>     > WARNING: QA Issue: qtx11extras:
>     > /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1
>     +gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
>     > is owned by uid 1000, which is the same as the user running bitbake.
>     > This may be due to host contamination [host-user-contaminated]
>     > WARNING: QA Issue: qtxmlpatterns:
>     > /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1
>     +gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
>     > is owned by uid 1000, which is the same as the user running bitbake.
>     > This may be due to host contamination [host-user-contaminated]
>     >
>     > I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes
>     > set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
>     >
>     > Help appreciated
>     >
>     > Andreas
>
>     I see this also in my builds. The warnings clutter the build output in a
>     way that makes the warnings mostly useless. Who will spot the one
>     important new warning in the hundreds of host-user-contaminated ones?
>     A fresh build of core-image-minimal today gave me 54 of these warnings.
>     All but one (glibc-locale) complaining on source files.
>
>     I checked a few recipes and most of them were not even using a custom
>     do_install but autotools generated 'make install' with something like
>     'cp -p src/* dest/' or so.
>
>
> Yes, this is the most common case. Usage of cp -a or cp -p means the build ownership is retained, and no chown is run to fix it.
>
>     Even if I know how to do it I think we should not patch upstream sources
>     to suppress a warning introduced by the downstream build system with
>     loads of false positives and then have to maintain the patches as
>     upstream is progressing.
>
>
> Either we're calling the upstream buildsystem and not running cp directly, in which case it's a bug in the upstream buildsystem, since make install will result
> in non-deterministic behavior in the ownership of the installed files, or it's a cp -a case, which doesn't require altering upstream with a patch at all, only
> recipe modification.
>
>     I haven't looked into how one does it but I'm inclined to switch of the
>     warning globally, e.g. in local.conf.
>
>
> Blindly disabling them will just result in ignoring a problem. Files in the target filesystem are owned by your build user, who most likely doesn't even exist
> on target.

For me the issues are all reported with -dbg packages.
All are source files in /<packagename>-dbg/usr/src/debug/<packagename>/...
Last build had 126 packages with the warning.
Including things like:
gcc-linaro-4.9: gcc: 
/gcc-dbg/usr/src/debug/gcc/linaro-4.9-r2015.06/gcc-linaro-4.9-2015.06/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/gcc/tm-preds.h is owned by uid 
1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
systemd-226+gitAUTOINC+4211d5bd13: systemd: /systemd-dbg/usr/src/debug/systemd/1_226+gitAUTOINC+4211d5bd13-r0/git/src/udev/scsi_id/scsi_serial.c is owned by uid 
1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
perl-5.22.0: perl: /perl-dbg/usr/src/debug/perl/5.22.0-r0/perl-5.22.0/ext/re/re_exec.c is owned by uid 1000, which is the same as the user running bitbake. This 
may be due to host contamination [host-user-contaminated]



-- 
Regards
Phil Reid



Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1D24C6E660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:44:32 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id o80so75787855wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=bE7XELsmDkDddH5MenrR+1U/2V5wxyyyfmXl0GKSCv0=;
	b=fLWRKz0B8ocnCdvzbh04hrRAKMWYLIu4u4oR8O2l3BHJ3AUV6ntlr+w5XyN+xsfkC2
	EfI/K4wGfhnfrhFeqjcnSW3RWvNzy88RiTk7lrhNV4+W5BQfdRmmMif73OHjx/oIwls+
	GgkovF4r0PnPSpFYTQ00vFe3jcN3ATP4Ur4I5F4bCgS26v8QnwLMPQNDWrWbLuhjukj1
	mcJQ1ktb76xxlH2Wl6R5kNUU2LJMRzFp1iUZ90ucdWHWYZHoluIXLH7aIDY/gazgsnXw
	H5llAM3RutE4CUnB7ZEf3lDuZJf3Cdu5eZ9dlDjEGXtreECOfuABY757TyKBxscytG0x
	qZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bE7XELsmDkDddH5MenrR+1U/2V5wxyyyfmXl0GKSCv0=;
	b=lCNYCSQ/Q/T+sOtd0c+jBgaRH7og0zVNEv+zcmhYQITvlhA6LiJbmcUJ7t8b+iCN+i
	9EfBjhc48EEl235M9Oom0enznEUi8cbPKCclmh+mhN4sRcGbtG08m2M3pky4KG7G85Jj
	ney7xFkhFMevNG5wMhTaiKC+bHFS3CZQJsyFxqtxWi87LMNCoZ8TMF27YshB/qKY5V0D
	iOg6UpOHU8SLGxIj3Dk22ZrwFueaxbBE1oF5Ug/CM6dKWoXZwh7ED/6hxi968tbOcbID
	YQS4lbE/oKhFCNSlelDrqwZ8FqJmmfnNbVawwmtrM+llaRO2/rd3bvZcA8WXQmHmea2l
	ujyQ==
X-Gm-Message-State: AEkooutgRMZ4jySU2jQQajUUSCanJaquCx3pOB31nN3OFB6qBPiKccd4QU18Tos6EEdmI4ql6htkE5ztPmLCKQ==
X-Received: by 10.194.18.35 with SMTP id t3mr7823709wjd.174.1472136272419;
	Thu, 25 Aug 2016 07:44:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.148.88 with HTTP; Thu, 25 Aug 2016 07:43:51 -0700 (PDT)
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Thu, 25 Aug 2016 20:13:51 +0530
Message-ID: <CALDxG5jN6gi0naERO2bksjy50FNwymdbmgK3XDHLmiUPSGswgw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Terminating matchbox window manager leads to DRM lockups
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
X-List-Received-Date: Thu, 25 Aug 2016 14:44:33 -0000
Content-Type: multipart/alternative; boundary=14dae93b5aea942209053ae66f74

--14dae93b5aea942209053ae66f74
Content-Type: text/plain; charset=UTF-8

Hello All,

I am building latest yocto with core-image-sato and noticed that matchbox
session or its relative apps are using kernel context and eventually these
are shown when the window manager is terminated or the target is rebooted.
Please see the logs below:

Target: i.MX6Q ARM
Kernel: Linux-4.1
Yocto: master (7b9f59)


--------------------------------------
root@mx6q:~# ps | grep match
  558 root      7080 S    matchbox-window-manager -theme Sato -use_cursor
yes
  612 root      174m S    matchbox-desktop
  614 root      174m S    matchbox-panel --start-applets
showdesktop,windowselector --end-applets
clock,battery,,systray,startup-notify,notify
  677 root      2752 S    grep match
root@mx6q:~#
root@mx6q:~#
root@mx6q:~# opkg list | grep -i xserver-xorg
xserver-xorg - 2:1.18.4-r0.3
xserver-xorg-extension-glx - 2:1.18.4-r0.3
xserver-xorg-extension-viv-autohdmi - 3:5.0.11.p8.4-r0.3
xserver-xorg-module-exa - 2:1.18.4-r0.3
root@mx6q:~# opkg list | grep -i matchbox
matchbox-config-gtk - 0.2-r0.2
matchbox-desktop - 2.1-r0.2
matchbox-keyboard - 0.1.1-r0.2
matchbox-keyboard-applet - 0.1.1-r0.2
matchbox-keyboard-im - 0.1.1-r0.2
matchbox-panel-2 - 2.11-r0.2
matchbox-session - 0.1-r4.0
matchbox-session-sato - 0.1-r30.0
matchbox-terminal - 0.1-r0.2
matchbox-theme-sato - 0.2-r0.0
matchbox-wm - 1.2.1-r0.1
root@mx6q:~#
root@mx6q:~# kill 558
root@mx6q:~# [  404.937507] [drm:drm_legacy_unlock] *ERROR* Process 614
using kernel context 0
[  404.947643] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock
[  404.953752] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel
context 0
[  405.132658] [drm:drm_legacy_unlock] *ERROR* Process 612 using kernel
context 0
[  405.140370] [drm:drm_legacy_unlock] *ERROR* Process 614 using kernel
context 0
--------------------------------------

Reboot scenario:
---------------------------------------
root@mx6q:~#
root@mx6q:~# ps | grep -i match
  569 root      7080 S    matchbox-window-manager -theme Sato -use_cursor
yes
  621 root      174m S    matchbox-desktop
  622 root      174m S    matchbox-panel --start-applets
showdesktop,windowselector --end-applets
clock,battery,,systray,startup-notify,notify
  652 root      2752 S    grep -i match
root@mx6q:~#
root@mx6q:~# reboot
[   26.234069] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel
context 0
[   26.247957] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel
context 0
[   26.261257] [drm:drm_legacy_unlock] *ERROR* Process 621 using kernel
context 0
[   26.268810] [drm:drm_lock_take] *ERROR* 1 holds heavyweight lock
---------------------------------------

Killing Xorg directly does not have any issue related to DRM lockup, but
termination of matchbox session is showing up these errors. The target has
DRM support and runs on accelerated graphics.

This is not seen on "krogoth yocto-2.1" builds.

Did anyone notice this on most recent core-image-sato running on DRM
enabled target ?

Any pointers will be much appreciated.

TIA!

--14dae93b5aea942209053ae66f74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><font face=3D"monospace,mono=
space">Hello All, <br><br></font></div><font face=3D"monospace,monospace">I=
 am building latest yocto with core-image-sato and noticed that matchbox se=
ssion or its relative apps are using kernel context and eventually these ar=
e shown when the window manager is terminated or the target is rebooted. Pl=
ease see the logs below:<br><br></font></div><div><font face=3D"monospace,m=
onospace">Target: i.MX6Q ARM<br></font></div><div><font face=3D"monospace,m=
onospace">Kernel: Linux-4.1<br></font></div><div><font face=3D"monospace,mo=
nospace">Yocto: master (7b9f59)<br></font><table summary=3D"commit info" cl=
ass=3D"" height=3D"24" width=3D"369"><tbody><tr><th><br></th><td colspan=3D=
"2" class=3D""><br></td></tr></tbody></table></div><div><font face=3D"monos=
pace,monospace">--------------------------------------<br>root@mx6q:~# ps |=
 grep match<br>=C2=A0 558 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7080 S=C2=A0=
=C2=A0=C2=A0 matchbox-window-manager -theme Sato -use_cursor yes<br>=C2=A0 =
612 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=C2=A0=C2=A0 matchbox-de=
sktop<br>=C2=A0 614 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=C2=A0=
=C2=A0 matchbox-panel --start-applets showdesktop,windowselector --end-appl=
ets clock,battery,,systray,startup-notify,notify<br>=C2=A0 677 root=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2752 S=C2=A0=C2=A0=C2=A0 grep match<br>root@mx6q:~=
# <br>root@mx6q:~# <br>root@mx6q:~# opkg list | grep -i xserver-xorg<br>xse=
rver-xorg - 2:1.18.4-r0.3<br>xserver-xorg-extension-glx - 2:1.18.4-r0.3<br>=
xserver-xorg-extension-viv-autohdmi - 3:5.0.11.p8.4-r0.3<br>xserver-xorg-mo=
dule-exa - 2:1.18.4-r0.3<br>root@mx6q:~# opkg list | grep -i matchbox=C2=A0=
=C2=A0=C2=A0 <br>matchbox-config-gtk - 0.2-r0.2<br>matchbox-desktop - 2.1-r=
0.2<br>matchbox-keyboard - 0.1.1-r0.2<br>matchbox-keyboard-applet - 0.1.1-r=
0.2<br>matchbox-keyboard-im - 0.1.1-r0.2<br>matchbox-panel-2 - 2.11-r0.2<br=
>matchbox-session - 0.1-r4.0<br>matchbox-session-sato - 0.1-r30.0<br>matchb=
ox-terminal - 0.1-r0.2<br>matchbox-theme-sato - 0.2-r0.0<br>matchbox-wm - 1=
.2.1-r0.1<br>root@mx6q:~# <br>root@mx6q:~# kill 558<br>root@mx6q:~# [=C2=A0=
 404.937507] [drm:drm_legacy_unlock] *ERROR* Process 614 using kernel conte=
xt 0<br>[=C2=A0 404.947643] [drm:drm_lock_take] *ERROR* 1 holds heavyweight=
 lock<br>[=C2=A0 404.953752] [drm:drm_legacy_unlock] *ERROR* Process 612 us=
ing kernel context 0<br>[=C2=A0 405.132658] [drm:drm_legacy_unlock] *ERROR*=
 Process 612 using kernel context 0<br>[=C2=A0 405.140370] [drm:drm_legacy_=
unlock] *ERROR* Process 614 using kernel context 0<br>---------------------=
-----------------<br><br></font></div><font face=3D"monospace,monospace">Re=
boot scenario:<br>---------------------------------------<br>root@mx6q:~# <=
br>root@mx6q:~# ps | grep -i match<br>=C2=A0 569 root=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 7080 S=C2=A0=C2=A0=C2=A0 matchbox-window-manager -theme Sato -use=
_cursor yes<br>=C2=A0 621 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 174m S=C2=A0=
=C2=A0=C2=A0 matchbox-desktop<br>=C2=A0 622 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 174m S=C2=A0=C2=A0=C2=A0 matchbox-panel --start-applets showdesktop,win=
dowselector --end-applets clock,battery,,systray,startup-notify,notify<br>=
=C2=A0 652 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2752 S=C2=A0=C2=A0=C2=A0 grep=
 -i match<br>root@mx6q:~# <br>root@mx6q:~# reboot<br>[=C2=A0=C2=A0 26.23406=
9] [drm:drm_legacy_unlock] *ERROR* Process 622 using kernel context 0<br>[=
=C2=A0=C2=A0 26.247957] [drm:drm_legacy_unlock] *ERROR* Process 622 using k=
ernel context 0<br>[=C2=A0=C2=A0 26.261257] [drm:drm_legacy_unlock] *ERROR*=
 Process 621 using kernel context 0<br>[=C2=A0=C2=A0 26.268810] [drm:drm_lo=
ck_take] *ERROR* 1 holds heavyweight lock<br>------------------------------=
---------<br><br></font></div><font face=3D"monospace,monospace">Killing Xo=
rg directly does not have any issue related to DRM lockup, but termination =
of matchbox session is showing up these errors. The target has DRM support =
and runs on accelerated graphics. <br><br></font></div><div><font face=3D"m=
onospace,monospace">This is not seen on &quot;krogoth yocto-2.1&quot; build=
s. <br><br></font></div><font face=3D"monospace,monospace">Did anyone notic=
e this on most recent core-image-sato running on DRM enabled target ?<br><b=
r></font></div><font face=3D"monospace,monospace">Any pointers will be much=
 appreciated. <br><br></font></div><font face=3D"monospace,monospace">TIA!<=
br></font></div>

--14dae93b5aea942209053ae66f74--

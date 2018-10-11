Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id CA48179A6C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 08:47:37 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q5-v6so8685091wrw.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c2aXJXZHaZ9Wf4WDPvBOMa1YNg0zbWeEXQUfule73xg=;
	b=o0nhrRDwq7DEYEk6A53vcSQkPUNDV8AHRjUOvioQLPvrgtE+wYv8mAq49cArjY/jwt
	Pdj4u9Fmswdc6yyicJfgJArRmOunUVItwjMlQwRFgu0v7RVzmzXrb7WBrsW7c0CwiV1F
	JM+KUIfJNpHv9JzbMa7D45B9JpK5vMlD9DftkI+kmcuicnWp0zWyxeWUPE5vJAY7GxII
	uDlnt4r2j3Hzw4lUgF78/KB6+b7nzNBXNn+L7LKkOn4e+ZXDGgU7g0GsFYGKeImYlxPO
	cz1LHixno6/zcoYOaJzFFX5cnLMt+fgqOk2lUaaBDCJ/2ESbptRAEg/0x9vWBUFsPZOC
	pH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c2aXJXZHaZ9Wf4WDPvBOMa1YNg0zbWeEXQUfule73xg=;
	b=beqeTO1TLAYXiyQf9fRL2pQAbTDDO7bHjM/l6blTOmeo9FfSg1GgFH5gd83sKf0Qmw
	DCthGqV/pu0wUFxiJ9mT2e5+wwJleJvtnLowo23Re+Nqak0dd0HAGXpnYDHxnkhUdML1
	WmhJ48m7tvO3mNlMr+JXPwfqP10olSlyKmC/7IzxQOsEsvormgblLo1UOUjvIzDd4Flz
	YytvUFzZEVwfDe6h0HItlAR2Bw+I37bY8Tm73p0Dk943+k1S8ZcZ8PJAx0/UvK4jTkH3
	/voJfSnGPgzzRwh7QTJ1eiIYFkE9B7sZ0Lv+mH+tBiTWpe4V4bengKnLg1xuzJVrZWcR
	oCTw==
X-Gm-Message-State: ABuFfojfswaZTVqYL8+c4wyKjUiYb/TkbeRoDnZbz/r3iupwag2oGvot
	gWPyjH77O7iuqruIzKtH4BkwCUguWXHq6MlOO2k=
X-Google-Smtp-Source: ACcGV61a2ouWS5szu+cbpuk3Rg/GlsAroeBG4Te8PnaX8uSp6ZMi7CM9/YRHoo6ZRRdaK/pWrV054SPKwa8zxyk5+RE=
X-Received: by 2002:adf:e842:: with SMTP id d2-v6mr619485wrn.175.1539247658253;
	Thu, 11 Oct 2018 01:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20181011084111.11619-1-anuj.mittal@intel.com>
	<20181011084111.11619-2-anuj.mittal@intel.com>
In-Reply-To: <20181011084111.11619-2-anuj.mittal@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Oct 2018 10:47:26 +0200
Message-ID: <CA+chaQdhoxqeXAg57iM2mvjW+r_Y2T_yMxLFhgo=KkkWBz0gjw@mail.gmail.com>
To: anuj.mittal@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] busybox: move reboot out of init.cfg
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
X-List-Received-Date: Thu, 11 Oct 2018 08:47:38 -0000
Content-Type: multipart/alternative; boundary="000000000000e448e30577f005db"

--000000000000e448e30577f005db
Content-Type: text/plain; charset="UTF-8"

Does busybox's reboot work fine with recent systemd?

It stopped working for me and unfortunately u-a silently replaces
reboot -> ../bin/systemctl
symlink with
/sbin/reboot -> /bin/busybox.nosuid

In my images the busybox applets are unusable:
    root@rpijama:~# reboot
    root@rpijama:~# [ 2495.348099] systemd: 18 output lines suppressed due
to ratelimiting
    [ 2495.380408] systemd[1]: systemd 239 running in system mode. (-PAM
-AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP
-GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN
-PCRE2 default-hierarchy=hybrid)
    [ 2495.402735] systemd[1]: Detected architecture arm.
    [ 2495.501328] systemd[1]: File
/lib/systemd/system/systemd-udevd.service:36 configures an IP firewall
(IPAddressDeny=any), but the local system does not support BPF/cgroup based
firewalling.
    [ 2495.519048] systemd[1]: Proceeding WITHOUT firewalling in effect!
(This warning is only shown for the first loaded unit using IP firewalling.)

    root@rpijama:~# halt
    [ 2521.200058] systemd[1]: Received SIGUSR1 from PID 1062 (halt).
    [ 2521.206062] systemd[1]: Trying to reconnect to bus...

and it doesn't reboot or halt.

You can update systemd to use u-a for those commands as well, that way
systemd version will win when both are enabled.

The same does apply for reboot, halt, poweroff:

symlinks provided by systemd:
    lrwxrwxrwx 1 bitbake bitbake   16 Mar  9  2018 halt -> ../bin/systemctl
    lrwxrwxrwx 1 bitbake bitbake   22 Mar  9  2018 init ->
../lib/systemd/systemd
    lrwxrwxrwx 1 bitbake bitbake   16 Mar  9  2018 poweroff ->
../bin/systemctl
    lrwxrwxrwx 1 bitbake bitbake   16 Mar  9  2018 reboot ->
../bin/systemctl
    lrwxrwxrwx 1 bitbake bitbake   21 Mar  9  2018 resolvconf ->
../usr/bin/resolvectl
    lrwxrwxrwx 1 bitbake bitbake   16 Mar  9  2018 runlevel ->
../bin/systemctl
    lrwxrwxrwx 1 bitbake bitbake   16 Mar  9  2018 shutdown ->
../bin/systemctl
    lrwxrwxrwx 1 bitbake bitbake   16 Mar  9  2018 telinit ->
../bin/systemctl

    are silently overwritten by u-a symlinks pointing to busybox:
    root@rpijama:~# ls -lah /sbin/halt /sbin/init /sbin/poweroff
/sbin/reboot /sbin/resolvconf /sbin/runlevel /sbin/shutdown /sbin/telinit
    lrwxrwxrwx    1 root     root          19 Mar  9  2018 /sbin/halt ->
/bin/busybox.nosuid
    lrwxrwxrwx    1 root     root          22 Mar  9  2018 /sbin/init ->
../lib/systemd/systemd
    lrwxrwxrwx    1 root     root          19 Mar  9  2018 /sbin/poweroff
-> /bin/busybox.nosuid
    lrwxrwxrwx    1 root     root          19 Mar  9  2018 /sbin/reboot ->
/bin/busybox.nosuid
    lrwxrwxrwx    1 root     root          21 Mar  9  2018 /sbin/resolvconf
-> ../usr/bin/resolvectl
    lrwxrwxrwx    1 root     root          16 Mar  9  2018 /sbin/runlevel
-> ../bin/systemctl
    lrwxrwxrwx    1 root     root          16 Mar  9  2018 /sbin/shutdown
-> ../bin/systemctl

Cheers,


On Thu, Oct 11, 2018 at 10:41 AM Anuj Mittal <anuj.mittal@intel.com> wrote:

> reboot is needed for initramfs where no init manager is set. This
> partially reverts:
>
> commit b6fbb3f3d4d6367b0fd7921078f67057551c7ede
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Jul 30 17:41:57 2018 +0800
>
>     busybox: move init related configs to init.cfg
>
>     Move init related configs to init.cfg.
>
>     These config items do not make much sense unless busybox is selected
>     as the init manager. They should belong to init.cfg.
>
> We would need to set up ALTERNATIVES for reboot in this case.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-core/busybox/busybox/defconfig | 2 +-
>  meta/recipes-core/busybox/busybox/init.cfg  | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig
> b/meta/recipes-core/busybox/busybox/defconfig
> index f081f281cc..32213c0675 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -480,7 +480,7 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
>  # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
>  # CONFIG_HALT is not set
>  # CONFIG_POWEROFF is not set
> -# CONFIG_REBOOT is not set
> +CONFIG_REBOOT=y
>  # CONFIG_FEATURE_CALL_TELINIT is not set
>  # CONFIG_TELINIT_PATH is not set
>  # CONFIG_INIT is not set
> diff --git a/meta/recipes-core/busybox/busybox/init.cfg
> b/meta/recipes-core/busybox/busybox/init.cfg
> index 3c1fdd42b6..3b839c515c 100644
> --- a/meta/recipes-core/busybox/busybox/init.cfg
> +++ b/meta/recipes-core/busybox/busybox/init.cfg
> @@ -2,7 +2,6 @@ CONFIG_INIT=y
>  CONFIG_FEATURE_USE_INITTAB=y
>  CONFIG_HALT=y
>  CONFIG_POWEROFF=y
> -CONFIG_REBOOT=y
>  CONFIG_FEATURE_KILL_DELAY=0
>  CONFIG_TELINIT_PATH=""
>  CONFIG_INIT_TERMINAL_TYPE=""
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e448e30577f005db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Does busybox&#39;s reboot work fine with recent systemd?<div><br>=
</div><div>It stopped working for me and unfortunately u-a silently replace=
s</div><div><div>reboot -&gt; ../bin/systemctl</div></div><div>symlink with=
</div><div><div>/sbin/reboot -&gt; /bin/busybox.nosuid</div></div><div><br>=
</div><div>In my images the busybox applets are unusable:</div><div><div>=
=C2=A0 =C2=A0 root@rpijama:~# reboot</div><div>=C2=A0 =C2=A0 root@rpijama:~=
# [ 2495.348099] systemd: 18 output lines suppressed due to ratelimiting</d=
iv><div>=C2=A0 =C2=A0 [ 2495.380408] systemd[1]: systemd 239 running in sys=
tem mode. (-PAM -AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBC=
RYPTSETUP -GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -ID=
N2 -IDN -PCRE2 default-hierarchy=3Dhybrid)</div><div>=C2=A0 =C2=A0 [ 2495.4=
02735] systemd[1]: Detected architecture arm.</div><div>=C2=A0 =C2=A0 [ 249=
5.501328] systemd[1]: File /lib/systemd/system/systemd-udevd.service:36 con=
figures an IP firewall (IPAddressDeny=3Dany), but the local system does not=
 support BPF/cgroup based firewalling.</div><div>=C2=A0 =C2=A0 [ 2495.51904=
8] systemd[1]: Proceeding WITHOUT firewalling in effect! (This warning is o=
nly shown for the first loaded unit using IP firewalling.)</div><div>=C2=A0=
 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 root@rpijama:~# halt</div><div>=C2=A0=
 =C2=A0 [ 2521.200058] systemd[1]: Received SIGUSR1 from PID 1062 (halt).</=
div><div>=C2=A0 =C2=A0 [ 2521.206062] systemd[1]: Trying to reconnect to bu=
s...</div></div><div><br></div><div>and it doesn&#39;t reboot or halt.</div=
><div><br></div><div>You can update systemd to use u-a for those commands a=
s well, that way systemd version will win when both are enabled.</div><div>=
<br></div><div>The same does apply for reboot, halt, poweroff:</div><div><b=
r></div><div><div>symlinks provided by systemd:</div><div>=C2=A0 =C2=A0 lrw=
xrwxrwx 1 bitbake bitbake=C2=A0 =C2=A016 Mar=C2=A0 9=C2=A0 2018 halt -&gt; =
../bin/systemctl</div><div>=C2=A0 =C2=A0 lrwxrwxrwx 1 bitbake bitbake=C2=A0=
 =C2=A022 Mar=C2=A0 9=C2=A0 2018 init -&gt; ../lib/systemd/systemd</div><di=
v>=C2=A0 =C2=A0 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A016 Mar=C2=A0 9=C2=
=A0 2018 poweroff -&gt; ../bin/systemctl</div><div>=C2=A0 =C2=A0 lrwxrwxrwx=
 1 bitbake bitbake=C2=A0 =C2=A016 Mar=C2=A0 9=C2=A0 2018 reboot -&gt; ../bi=
n/systemctl</div><div>=C2=A0 =C2=A0 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=
=A021 Mar=C2=A0 9=C2=A0 2018 resolvconf -&gt; ../usr/bin/resolvectl</div><d=
iv>=C2=A0 =C2=A0 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A016 Mar=C2=A0 9=C2=
=A0 2018 runlevel -&gt; ../bin/systemctl</div><div>=C2=A0 =C2=A0 lrwxrwxrwx=
 1 bitbake bitbake=C2=A0 =C2=A016 Mar=C2=A0 9=C2=A0 2018 shutdown -&gt; ../=
bin/systemctl</div><div>=C2=A0 =C2=A0 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =
=C2=A016 Mar=C2=A0 9=C2=A0 2018 telinit -&gt; ../bin/systemctl</div><div>=
=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 are silently overwritten by u-a=
 symlinks pointing to busybox:</div><div>=C2=A0 =C2=A0 root@rpijama:~# ls -=
lah /sbin/halt /sbin/init /sbin/poweroff /sbin/reboot /sbin/resolvconf /sbi=
n/runlevel /sbin/shutdown /sbin/telinit</div><div>=C2=A0 =C2=A0 lrwxrwxrwx=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 19 Mar=C2=A0 9=C2=A0 2018 /sbin/halt -&gt; /bin/busybox.nosuid</div><di=
v>=C2=A0 =C2=A0 lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 22 Mar=C2=A0 9=C2=A0 2018 /sbin/init -&gt; =
../lib/systemd/systemd</div><div>=C2=A0 =C2=A0 lrwxrwxrwx=C2=A0 =C2=A0 1 ro=
ot=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19 Mar=C2=A0 9=
=C2=A0 2018 /sbin/poweroff -&gt; /bin/busybox.nosuid</div><div>=C2=A0 =C2=
=A0 lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 19 Mar=C2=A0 9=C2=A0 2018 /sbin/reboot -&gt; /bin/busybox=
.nosuid</div><div>=C2=A0 =C2=A0 lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0=
 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 21 Mar=C2=A0 9=C2=A0 2018 /sb=
in/resolvconf -&gt; ../usr/bin/resolvectl</div><div>=C2=A0 =C2=A0 lrwxrwxrw=
x=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 16 Mar=C2=A0 9=C2=A0 2018 /sbin/runlevel -&gt; ../bin/systemctl</div=
><div>=C2=A0 =C2=A0 lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16 Mar=C2=A0 9=C2=A0 2018 /sbin/shutdown=
 -&gt; ../bin/systemctl</div></div><div><br></div><div>Cheers,</div><div><b=
r></div></div></div></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Thu, Oct 11, 2018 at 10:41 AM Anuj Mittal &lt;<a href=3D"mail=
to:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">reboot is needed for initramfs where no init ma=
nager is set. This<br>
partially reverts:<br>
<br>
commit b6fbb3f3d4d6367b0fd7921078f67057551c7ede<br>
Author: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Mon Jul 30 17:41:57 2018 +0800<br>
<br>
=C2=A0 =C2=A0 busybox: move init related configs to init.cfg<br>
<br>
=C2=A0 =C2=A0 Move init related configs to init.cfg.<br>
<br>
=C2=A0 =C2=A0 These config items do not make much sense unless busybox is s=
elected<br>
=C2=A0 =C2=A0 as the init manager. They should belong to init.cfg.<br>
<br>
We would need to set up ALTERNATIVES for reboot in this case.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/busybox/busybox/defconfig | 2 +-<br>
=C2=A0meta/recipes-core/busybox/busybox/init.cfg=C2=A0 | 1 -<br>
=C2=A02 files changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-cor=
e/busybox/busybox/defconfig<br>
index f081f281cc..32213c0675 100644<br>
--- a/meta/recipes-core/busybox/busybox/defconfig<br>
+++ b/meta/recipes-core/busybox/busybox/defconfig<br>
@@ -480,7 +480,7 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=3Dy<br>
=C2=A0# CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set<br>
=C2=A0# CONFIG_HALT is not set<br>
=C2=A0# CONFIG_POWEROFF is not set<br>
-# CONFIG_REBOOT is not set<br>
+CONFIG_REBOOT=3Dy<br>
=C2=A0# CONFIG_FEATURE_CALL_TELINIT is not set<br>
=C2=A0# CONFIG_TELINIT_PATH is not set<br>
=C2=A0# CONFIG_INIT is not set<br>
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core=
/busybox/busybox/init.cfg<br>
index 3c1fdd42b6..3b839c515c 100644<br>
--- a/meta/recipes-core/busybox/busybox/init.cfg<br>
+++ b/meta/recipes-core/busybox/busybox/init.cfg<br>
@@ -2,7 +2,6 @@ CONFIG_INIT=3Dy<br>
=C2=A0CONFIG_FEATURE_USE_INITTAB=3Dy<br>
=C2=A0CONFIG_HALT=3Dy<br>
=C2=A0CONFIG_POWEROFF=3Dy<br>
-CONFIG_REBOOT=3Dy<br>
=C2=A0CONFIG_FEATURE_KILL_DELAY=3D0<br>
=C2=A0CONFIG_TELINIT_PATH=3D&quot;&quot;<br>
=C2=A0CONFIG_INIT_TERMINAL_TYPE=3D&quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e448e30577f005db--

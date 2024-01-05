Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EEFC47077
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 16:06:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.26935.1704470759067284488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 08:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PaMtHYzF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e3ab65709so4489775e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704470757; x=1705075557; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lmU6GWnbp8dJOs2EVipqpOn/GUVVbtAYcvPolNk/PLA=;
        b=PaMtHYzF48AlbWq76vrryXfH4xmqOMsFlYb5e/yx8bATSxxz8fr0D7tT2OUXUKUs08
         LZNlvHq4RwyXX6RyHY4akBp3qrH+OFWJ1WUQDa/YxDpFJLKSeZEG1bVxGLR09hhkQ6cw
         jmYJMdu8t7/yJfYLT4rUO765pGrrxis4F5m3c3pGNSspKFKiRnPmIDBW/hU/M1dFwTku
         SZSonb5uWA2okoHfYENp/fWNvEcaPu7ywukon7VWd9sR/y2sOwRET9BGL7Us+gba4eYK
         VBeh3AQsZ379jL7nQoyA2Fp9Eafqie4/h0VTgB7C2uUoTg+arBt3Dr7aFEMsvcRlWy6Y
         b8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470757; x=1705075557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmU6GWnbp8dJOs2EVipqpOn/GUVVbtAYcvPolNk/PLA=;
        b=CnTu1DK3Yg9YCBfcbOnvD+ecVrze+vb21NqUHhr7O9FNubi0xnY4GtuAlDmfQvAJQU
         OofuL6LkGTIj9HGpw9490fgQWW0mXdunPA/RXaOupq079jitIWqt22X61gECaawRWqKP
         jkxl4aEjyJJHLVSpnY9fF9GSI/L/27ZNJR2/oEkWJqB9sRGe4Lyh/CP3xDieVOVc8066
         3uLNw/Xq5PPFOBjg57ICg6TNasEwRXG86ceABnh9z32VODtto2jM+bOTabwN6uHQJK84
         5Tr7rT+JuGicUCVLF18CxuPFf4gMUG199MpuoHrXsxDhTwcz4vQv6a0g63rrjxq5Jq9S
         gfjw==
X-Gm-Message-State: AOJu0YySN3YBModzT8k1oSSQk2mjXzfg3G65L8kmO7jXupnxFgKMrdCh
	vUpMKvye9STfEvID3OoAgT5RBN2m1GL7LWEIpnc=
X-Google-Smtp-Source: AGHT+IGWbG7pH4TiL0057WsDBjiMnwPi3ngNaoRRAjwz2OOLXmQua3VH6p/DyP66mAiQL7wabZLw2alLdvobhs6kkpU=
X-Received: by 2002:a05:600c:3c94:b0:40d:4d76:89d7 with SMTP id
 bg20-20020a05600c3c9400b0040d4d7689d7mr1524532wmb.121.1704470757011; Fri, 05
 Jan 2024 08:05:57 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com> <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com> <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
 <CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp5NAPL56yow7bPAjSBngw@mail.gmail.com>
 <d11ce5f1-161b-4bd2-9bc5-2bd12d7659a9@windriver.com> <CANNYZj_L=rEwhgdWLchdzHYgdWMrkZ4rizCKvmF8hXotBcKgnw@mail.gmail.com>
In-Reply-To: <CANNYZj_L=rEwhgdWLchdzHYgdWMrkZ4rizCKvmF8hXotBcKgnw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Jan 2024 17:05:43 +0100
Message-ID: <CA+chaQdkdBa14M1w=z9bXr4MH7hB-dRCEjHiwLTk-y+tatZdEQ@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: randy.macleod@windriver.com, "steve@sakoman.com" <steve@sakoman.com>, zboszor@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000077fe060e3506bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193369

--0000000000000077fe060e3506bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I see the processes running after bitbake exit only in kirkstone and
only with
PRSERV_HOST =3D "localhost:0"
if I drop PRSERV_HOST then all 3 bitbake-server processes exist together
with bitbake itself.

luneos-kirkstone $ rm -f bitbake-cookerdaemon.log
luneos-kirkstone $ ps aux | grep luneos-kirkstone
martin   4184043  0.0  0.0   9124  2048 pts/4    S+   16:47   0:00 grep
--colour=3Dauto luneos-kirkstone
luneos-kirkstone $ bitbake -k zlib-native
NOTE: Started PRServer with DBfile:
/OE/build/luneos-kirkstone/cache/prserv.sqlite3, Address: 127.0.0.1:35811,
PID: 4184924
Loading cache: 100%
|##########################################################################=
###########################################################################=
#####################################################|
Time: 0:00:04
Loaded 4570 entries from dependency cache.
...
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 11 (100%
match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 92 tasks of which 92 didn't need to be rerun
and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 15 seconds
luneos-kirkstone $ ps aux | grep luneos-kirkstone
martin     51324  0.0  0.0   9124  2048 pts/4    S+   16:54   0:00 grep
--colour=3Dauto luneos-kirkstone
martin   4184584  8.9  0.4 668196 536892 ?       Sl   16:47   0:37
bitbake-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server
decafbad 3 5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log
/OE/build/luneos-kirkstone/bitbake.lock
/OE/build/luneos-kirkstone/bitbake.sock 0 None 0
martin   4184924  0.0  0.1 340280 196428 ?       S    16:47   0:00
bitbake-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server
decafbad 3 5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log
/OE/build/luneos-kirkstone/bitbake.lock
/OE/build/luneos-kirkstone/bitbake.sock 0 None 0
martin   4184927  0.0  0.1 340328 194440 ?       S    16:47   0:00
bitbake-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server
decafbad 3 5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log
/OE/build/luneos-kirkstone/bitbake.lock
/OE/build/luneos-kirkstone/bitbake.sock 0 None 0

luneos-kirkstone $ cat bitbake-cookerdaemon.log
4184584 16:47:38.367593 --- Starting bitbake server pid 4184584 at
2024-01-05 16:47:38.367526 ---
4184584 16:47:38.370315 Started bitbake server pid 4184584
4184584 16:47:38.370831 Entering server connection loop
4184584 16:47:38.372043 Accepting [<socket.socket fd=3D6, family=3D1, type=
=3D1,
proto=3D0, laddr=3Dbitbake.sock>] ([])
4184584 16:47:38.376431 Processing Client
4184584 16:47:38.376633 Connecting Client
4184584 16:47:38.377632 Running command ['setFeatures', [2, 1]]
4184584 16:47:38.379355 Command Completed
4184584 16:47:38.379868 Running command ['updateConfig', {'halt': False,
'force': False, 'invalidate_stamp': None, 'dry_run': False,
'dump_signatures': [], 'extra_assume_provided': [], 'profile': False,
'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False,
'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly':
None, 'writeeventlog': None, 'build_verbose_shell': False,
'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains':
{}}, {'SHELL': '/bin/bash', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'MACHINE DISTRO
TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy
SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS
PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER
WEBOS_DISTRO_BUILD_ID PSEUDO_DISABLED PSEUDO_BUILD', 'DISTRO': 'luneos',
'SSH_AUTH_SOCK': '/tmp/ssh-XXXXXX2ZxYBo/agent.1893', 'SSH_AGENT_PID':
'1894', 'PWD': '/OE/build/luneos-kirkstone', 'LOGNAME': 'martin', 'HOME':
'/home/martin-gentoo', 'MACHINE': 'qemux86-64', 'USER': 'martin', 'PATH':
'/OE/build/luneos-kirkstone/openembedded-core/scripts:/OE/build/luneos-kirk=
stone/bitbake/bin:/home/martin-gentoo/bin:/usr/local/sbin:/usr/local/bin:/u=
sr/bin:/opt/bin:/usr/lib/llvm/17/bin:/opt/android-sdk-update-manager/tools:=
/opt/android-sdk-update-manager/platform-tools:/etc/eselect/wine/bin:/usr/l=
ib64/opencascade/bin:/var/lib/snapd/snap/bin',
'LC_ALL': 'en_US.UTF-8', 'SESSION_MANAGER':
'local/jama:@/tmp/.ICE-unix/1838,unix/jama:/tmp/.ICE-unix/1838',
'WINDOWID': '35651587', 'COLORTERM': 'truecolor',
'CSF_MDTVTexturesDirectory': '/usr/share/opencascade/resources/Textures',
'MACHINES': 'qemux86-64', 'XDG_CONFIG_DIRS': '/etc/xdg', 'LESS': '-R -M
--shift 5', 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Session1',
'XDG_MENU_PREFIX': 'xfce-', 'JDK_HOME':
'/etc/java-config-2/current-system-vm', 'CONFIG_PROTECT_MASK':
'/etc/sandbox.d /etc/fonts/fonts.conf /etc/gentoo-release /etc/dconf
/etc/ca-certificates.conf /etc/revdep-rebuild', 'TERMCAP':
'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual
terminal:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:=
cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J=
:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=
=3D^G:cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#64:co#238:am:=
xn:xv:LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=
=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:=
ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=
=3D\\E[34l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\=
E[3m:se=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[=
m:ms:Co#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0=
:as=3D\\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxy=
yzz{{||}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Z0=3D\\E[?3h:Z1=3D\\E[?3l=
:Km=3D\\E[<:k0=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\=
\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=
=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=
=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\=
\EOB:kr=3D\\EOC:kl=3D\\EOD:km:',
'JAVA_HOME': '/etc/java-config-2/current-system-vm', 'CSF_MIGRATION_TYPES':
'/usr/share/opencascade/resources/StdResource/MigrationSheet.txt',
'WINDOW': '3', 'ANT_HOME': '/usr/share/ant', 'DESKTOP_SESSION': 'xfce',
'CSF_STEPDefaults': '/usr/share/opencascade/resources/XSTEPResource',
'EDITOR': 'vim', 'GTK_MODULES': 'canberra-gtk-module', 'XDG_SEAT': 'seat0',
'CONFIG_PROTECT': '/var/bind /usr/share/gnupg/qualified.txt
/usr/share/easy-rsa /usr/share/config
/usr/lib64/libreoffice/program/sofficerc', 'XDG_SESSION_DESKTOP': 'XFCE',
'XDG_SESSION_TYPE': 'x11', 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'MANPATH':
'/etc/java-config-2/current-system-vm/man:/usr/share/gcc-data/x86_64-pc-lin=
ux-gnu/13/man:/usr/share/binutils-data/x86_64-pc-linux-gnu/2.41/man:/etc/ja=
va-config-2/current-system-vm/man/:/usr/local/share/man:/usr/share/man:/usr=
/lib/rust/man:/usr/lib/llvm/17/share/man:/etc/eselect/wine/share/man',
'XAUTHORITY': '/tmp/xauth_CEynPY', 'CSF_StandardLiteDefaults':
'/usr/share/opencascade/resources/StdResource', 'OPENCL_PROFILE': 'nvidia',
'MOTD_SHOWN': 'pam', 'GDM_LANG': 'C.UTF-8', 'LANG': 'en_US.UTF-8',
'LS_COLORS':
'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=
=3D40;33;01:cd=3D40;33;01:or=3D01;05;37;41:mi=3D01;05;37;41:su=3D37;41:sg=
=3D30;43:ca=3D00:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:=
*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=
=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D0=
1;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lr=
z=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01=
;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.=
deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=
=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D0=
1;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.=
dwm=3D01;31:*.esd=3D01;31:*.avif=3D01;35:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjp=
g=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=
=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01=
;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35=
:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.m=
kv=3D01;35:*.webm=3D01;35:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=
=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01=
;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*=
.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D=
01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35=
:*.cfg=3D00;32:*.conf=3D00;32:*.diff=3D00;32:*.doc=3D00;32:*.ini=3D00;32:*.=
log=3D00;32:*.patch=3D00;32:*.pdf=3D00;32:*.ps=3D00;32:*.tex=3D00;32:*.txt=
=3D00;32:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00=
;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:=
*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xsp=
f=3D00;36:*~=3D00;90:*#=3D00;90:*.bak=3D00;90:*.crdownload=3D00;90:*.dpkg-d=
ist=3D00;90:*.dpkg-new=3D00;90:*.dpkg-old=3D00;90:*.dpkg-tmp=3D00;90:*.old=
=3D00;90:*.orig=3D00;90:*.part=3D00;90:*.rej=3D00;90:*.rpmnew=3D00;90:*.rpm=
orig=3D00;90:*.rpmsave=3D00;90:*.swp=3D00;90:*.tmp=3D00;90:*.ucf-dist=3D00;=
90:*.ucf-new=3D00;90:*.ucf-old=3D00;90:',
'XDG_CURRENT_DESKTOP': 'XFCE', 'VTE_VERSION': '7402', 'CSF_GraphicShr':
'/usr/lib64/opencascade/libTKOpenGl.so', 'OPENGL_PROFILE': 'xorg-x11',
'XDG_SEAT_PATH': '/org/freedesktop/DisplayManager/Seat0',
'QT_GRAPHICSSYSTEM': 'raster', 'XZ_OPT': '-T0', 'CSF_ShadersDirectory':
'/usr/share/opencascade/resources/Shaders', 'CSF_XmlOcafResource':
'/usr/share/opencascade/resources/XmlOcafResource', 'INFOPATH':
'/usr/share/gcc-data/x86_64-pc-linux-gnu/13/info:/usr/share/binutils-data/x=
86_64-pc-linux-gnu/2.41/info:/usr/share/autoconf-2.72/info:/usr/share/autoc=
onf-2.13/info:/usr/share/automake-1.16.5/info:/usr/share/info',
'MOZ_GMP_PATH':
'/usr/lib64/nsbrowser/plugins/gmp-gmpopenh264/system-installed',
'CSF_SHMessage': '/usr/share/opencascade/resources/SHMessage', 'JAVAC':
'/etc/java-config-2/current-system-vm/bin/javac', 'XDG_SESSION_CLASS':
'user', 'VBOX_SDK_PATH': '/usr/lib64/virtualbox/sdk', 'ANDROID_HOME':
'/opt/android-sdk-update-manager', 'TERM': 'screen.xterm-256color',
'VBOX_INSTALL_PATH': '/usr/lib64/virtualbox', 'LESSOPEN': '|lesspipe %s',
'ANDROID_SWT': '/usr/share/swt-3.7/lib', 'CSF_StandardDefaults':
'/usr/share/opencascade/resources/StdResource', 'CSF_IGESDefaults':
'/usr/share/opencascade/resources/XSTEPResource', 'MANPAGER': 'manpager',
'NPM_CONFIG_GLOBALCONFIG': '/etc/npm/npmrc', 'DISPLAY': ':0.0',
'CSF_XCAFDefaults': '/usr/share/opencascade/resources/StdResource',
'SHLVL': '2', 'PAGER': '/usr/bin/less', 'LEX': 'flex', 'XDG_VTNR': '2',
'CSF_PluginDefaults': '/usr/share/opencascade/resources/StdResource',
'XDG_SESSION_ID': '2', 'CASROOT': '/usr', 'XDG_RUNTIME_DIR':
'/run/user/1026', 'GCC_SPECS': '', 'GSETTINGS_BACKEND': 'dconf', 'PS1':
'\\[\\033[01;32m\\]OE $MACHINE@$DISTRO\\[\\033[01;34m\\] \\w
\\$\\[\\033[00m\\] ', 'CSF_XSMessage':
'/usr/share/opencascade/resources/XSMessage', 'XDG_DATA_DIRS':
'/usr/local/share:/usr/share:/etc/eselect/wine/share:/var/lib/snapd/desktop=
',
'CSF_UnitsDefinition':
'/usr/share/opencascade/resources/UnitsAPI/Units.dat', 'STY': '2067.x',
'VBOX_APP_HOME': '/usr/lib64/virtualbox', 'DBUS_SESSION_BUS_ADDRESS':
'unix:path=3D/run/user/1026/bus', 'INITPWD': '/OE/build/luneos-kirkstone',
'MAIL': '/var/mail/martin', 'OLDPWD': '/home/martin-gentoo', '_':
'/OE/build/luneos-kirkstone/bitbake/bin/bitbake'},
['/OE/build/luneos-kirkstone/bitbake/bin/bitbake', '-k', 'zlib-native']]
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228:
DeprecationWarning: ast.Str is deprecated and will be removed in Python
3.14; use ast.Constant instead
  if isinstance(node.args[0], ast.Str):
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229:
DeprecationWarning: Attribute s is deprecated and will be removed in Python
3.14; use value instead
  varname =3D node.args[0].s
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:230:
DeprecationWarning: ast.Str is deprecated and will be removed in Python
3.14; use ast.Constant instead
  if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:233:
DeprecationWarning: Attribute s is deprecated and will be removed in Python
3.14; use value instead
  self.contains[varname].add(node.args[1].s)
/usr/lib/python3.12/multiprocessing/popen_fork.py:66: DeprecationWarning:
This process (pid=3D4184584) is multi-threaded, use of fork() may lead to
deadlocks in the child.
  self.pid =3D os.fork()
4184584 16:47:45.108449 Command Completed
4184584 16:47:45.112267 Running command ['getVariable', 'BBINCLUDELOGS']
4184584 16:47:45.113080 Command Completed
4184584 16:47:45.113399 Running command ['getVariable',
'BBINCLUDELOGS_LINES']
4184584 16:47:45.113925 Command Completed
4184584 16:47:45.114218 Running command ['getSetVariable', 'BB_CONSOLELOG']
4184584 16:47:45.114956 Command Completed
4184584 16:47:45.115441 Running command ['getSetVariable', 'BB_LOGCONFIG']
4184584 16:47:45.116590 Command Completed
4184584 16:47:45.122232 Running command ['getUIHandlerNum']
4184584 16:47:45.122805 Command Completed
4184584 16:47:45.123194 Running command ['setEventMask', 1, 20,
{'BitBake.SigGen.HashEquiv': 19, 'BitBake.RunQueue.HashEquiv': 19},
['bb.runqueue.runQueueExitWait', 'bb.event.LogExecTTY',
'logging.LogRecord', 'bb.build.TaskFailed', 'bb.build.TaskBase',
'bb.event.ParseStarted', 'bb.event.ParseProgress',
'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted',
'bb.event.CacheLoadProgress', 'bb.event.CacheLoadCompleted',
'bb.command.CommandFailed', 'bb.command.CommandExit',
'bb.command.CommandCompleted', 'bb.cooker.CookerExit',
'bb.event.MultipleProviders', 'bb.event.NoProvider',
'bb.runqueue.sceneQueueTaskStarted', 'bb.runqueue.runQueueTaskStarted',
'bb.runqueue.runQueueTaskFailed', 'bb.runqueue.sceneQueueTaskFailed',
'bb.event.BuildBase', 'bb.build.TaskStarted', 'bb.build.TaskSucceeded',
'bb.build.TaskFailedSilent', 'bb.build.TaskProgress',
'bb.event.ProcessStarted', 'bb.event.ProcessProgress',
'bb.event.ProcessFinished']]
4184584 16:47:45.123558 Command Completed
4184584 16:47:45.123863 Running command ['getVariable', 'BB_DEFAULT_TASK']
4184584 16:47:45.124228 Command Completed
4184584 16:47:45.124528 Running command ['setConfig', 'cmd', 'build']
4184584 16:47:45.124858 Command Completed
4184584 16:47:45.125140 Running command ['buildTargets', ['zlib-native'],
'build']
4184584 16:47:45.125294 Command Completed
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228:
DeprecationWarning: ast.Str is deprecated and will be removed in Python
3.14; use ast.Constant instead
  if isinstance(node.args[0], ast.Str):
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229:
DeprecationWarning: Attribute s is deprecated and will be removed in Python
3.14; use value instead
  varname =3D node.args[0].s
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:230:
DeprecationWarning: ast.Str is deprecated and will be removed in Python
3.14; use ast.Constant instead
  if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:233:
DeprecationWarning: Attribute s is deprecated and will be removed in Python
3.14; use value instead
  self.contains[varname].add(node.args[1].s)
/usr/lib/python3.12/asyncio/streams.py:413: ResourceWarning: unclosed
<StreamWriter transport=3D<_SelectorSocketTransport closing fd=3D18 read=3D=
idle
write=3D<idle, bufsize=3D0>> reader=3D<StreamReader
transport=3D<_SelectorSocketTransport closing fd=3D18 read=3Didle write=3D<=
idle,
bufsize=3D0>>>>
  warnings.warn(f"unclosed {self!r}", ResourceWarning)
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228:
DeprecationWarning: ast.Str is deprecated and will be removed in Python
3.14; use ast.Constant instead
  if isinstance(node.args[0], ast.Str):
/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229:
DeprecationWarning: Attribute s is deprecated and will be removed in Python
3.14; use value instead
  varname =3D node.args[0].s
4184584 16:48:37.909973 Processing Client
4184584 16:48:37.910125 Disconnecting Client
4184584 16:48:37.910729 No timeout, exiting.
4184584 16:48:38.011341 Exiting

It is reproducible with nanbield as well and fixed in scarthgap, will
bisect it when time allows.

Regards,

On Sun, Dec 31, 2023 at 11:03=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> For what it's worth, I am not seeing any of these issues (hanging
> processes after bitbake exit, timeouts on world builds with all
> meta-oe-layers) with python 3.12 provided by buildtools-tarball. The
> issues are probably real, but it's also possible python 3.12 per se is
> not to blame.
>
> It would probably help if you check if what you're seeing occurs with
> python 3.12 from the tarball, which you can build from this branch:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/py3.12
> (the log in the web ui isn't updated yet, I just pushed)
>
> Alex
>
> On Fri, 22 Dec 2023 at 00:06, Randy MacLeod via lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > On 2023-12-21 1:56 p.m., Martin Jansa wrote:
> >
> > On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM Randy MacLeod <
> randy.macleod@windriver.com> wrote:
> >>
> >> On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via lists.openembedded.org
> wrote:
> >>
> >> So it's not just Fedora, but Python 3.12 in general.
> >>
> >> Googling for problem with threads + fork reveals that
> >> it is indeed an issue even in C / POSIX: only the thread
> >> executing fork() will become part of the new process,
> >> but not the main process starting the thread or any
> >> other threads from the original process.
> >>
> >> The warning is justified, and apparently the issue
> >> not occurring in bitbake with previous Python versions
> >> is pure luck.
> >>
> >> FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or later.
> >
> >
> > But this fixes it only for bitbake master, right?
> >
> > Even master might still have some problems.
> > I can do a simple build of a package but in doing:
> >
> > $ bitbake -k world
> >
> > I see:
> > NOTE: No reply from server in 30s (for command ping at 17:50:35.510798)
> >
> > After some time.
> >
> > I'm not going to try to debug it at this point in the day/year!
> >
> >
> > With bitbake 2.0 used in kirkstone I still see bitbake processes still
> running after the build is finished.
> >
> > I didn't try kirkstone. Maybe Steve has that on his list of things to d=
o
> in his spare time! ;-)
> >
> > ../Randy
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192854):
> https://lists.openembedded.org/g/openembedded-core/message/192854
> > Mute This Topic: https://lists.openembedded.org/mt/102826186/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000000077fe060e3506bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I see the processes running after bitbake exit only =
in kirkstone and only with<div>PRSERV_HOST =3D &quot;localhost:0&quot;<br><=
/div><div>if I drop PRSERV_HOST then all 3 bitbake-server processes exist t=
ogether with bitbake itself.</div><div><br></div><div>luneos-kirkstone $ rm=
 -f bitbake-cookerdaemon.log<br></div><div>luneos-kirkstone $ ps aux | grep=
 luneos-kirkstone<br>martin =C2=A0 4184043 =C2=A00.0 =C2=A00.0 =C2=A0 9124 =
=C2=A02048 pts/4 =C2=A0 =C2=A0S+ =C2=A0 16:47 =C2=A0 0:00 grep --colour=3Da=
uto luneos-kirkstone<br></div><div>luneos-kirkstone $ bitbake -k zlib-nativ=
e<br>NOTE: Started PRServer with DBfile: /OE/build/luneos-kirkstone/cache/p=
rserv.sqlite3, Address: <a href=3D"http://127.0.0.1:35811">127.0.0.1:35811<=
/a>, PID: 4184924<br>Loading cache: 100% |#################################=
###########################################################################=
###########################################################################=
###################| Time: 0:00:04<br>Loaded 4570 entries from dependency c=
ache.<br></div><div>...</div><div>Sstate summary: Wanted 10 Local 10 Mirror=
s 0 Missed 0 Current 11 (100% match, 100% complete)<br>NOTE: Executing Task=
s<br>NOTE: Tasks Summary: Attempted 92 tasks of which 92 didn&#39;t need to=
 be rerun and all succeeded.<br>NOTE: Writing buildhistory<br>NOTE: Writing=
 buildhistory took: 15 seconds<br></div><div>luneos-kirkstone $ ps aux | gr=
ep luneos-kirkstone<br></div>martin =C2=A0 =C2=A0 51324 =C2=A00.0 =C2=A00.0=
 =C2=A0 9124 =C2=A02048 pts/4 =C2=A0 =C2=A0S+ =C2=A0 16:54 =C2=A0 0:00 grep=
 --colour=3Dauto luneos-kirkstone<br>martin =C2=A0 4184584 =C2=A08.9 =C2=A0=
0.4 668196 536892 ? =C2=A0 =C2=A0 =C2=A0 Sl =C2=A0 16:47 =C2=A0 0:37 bitbak=
e-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server decafbad 3 5=
 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log /OE/build/luneos-kirks=
tone/bitbake.lock /OE/build/luneos-kirkstone/bitbake.sock 0 None 0<br>marti=
n =C2=A0 4184924 =C2=A00.0 =C2=A00.1 340280 196428 ? =C2=A0 =C2=A0 =C2=A0 S=
 =C2=A0 =C2=A016:47 =C2=A0 0:00 bitbake-server /OE/build/luneos-kirkstone/b=
itbake/bin/bitbake-server decafbad 3 5 /OE/build/luneos-kirkstone/bitbake-c=
ookerdaemon.log /OE/build/luneos-kirkstone/bitbake.lock /OE/build/luneos-ki=
rkstone/bitbake.sock 0 None 0<br>martin =C2=A0 4184927 =C2=A00.0 =C2=A00.1 =
340328 194440 ? =C2=A0 =C2=A0 =C2=A0 S =C2=A0 =C2=A016:47 =C2=A0 0:00 bitba=
ke-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server decafbad 3 =
5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log /OE/build/luneos-kirk=
stone/bitbake.lock /OE/build/luneos-kirkstone/bitbake.sock 0 None 0<div><br=
></div><div>luneos-kirkstone $ cat bitbake-cookerdaemon.log<br>4184584 16:4=
7:38.367593 --- Starting bitbake server pid 4184584 at 2024-01-05 16:47:38.=
367526 ---<br>4184584 16:47:38.370315 Started bitbake server pid 4184584<br=
>4184584 16:47:38.370831 Entering server connection loop<br>4184584 16:47:3=
8.372043 Accepting [&lt;socket.socket fd=3D6, family=3D1, type=3D1, proto=
=3D0, laddr=3Dbitbake.sock&gt;] ([])<br>4184584 16:47:38.376431 Processing =
Client<br>4184584 16:47:38.376633 Connecting Client<br>4184584 16:47:38.377=
632 Running command [&#39;setFeatures&#39;, [2, 1]]<br>4184584 16:47:38.379=
355 Command Completed<br>4184584 16:47:38.379868 Running command [&#39;upda=
teConfig&#39;, {&#39;halt&#39;: False, &#39;force&#39;: False, &#39;invalid=
ate_stamp&#39;: None, &#39;dry_run&#39;: False, &#39;dump_signatures&#39;: =
[], &#39;extra_assume_provided&#39;: [], &#39;profile&#39;: False, &#39;pre=
file&#39;: [], &#39;postfile&#39;: [], &#39;server_timeout&#39;: None, &#39=
;nosetscene&#39;: False, &#39;setsceneonly&#39;: False, &#39;skipsetscene&#=
39;: False, &#39;runall&#39;: None, &#39;runonly&#39;: None, &#39;writeeven=
tlog&#39;: None, &#39;build_verbose_shell&#39;: False, &#39;build_verbose_s=
tdout&#39;: False, &#39;default_loglevel&#39;: 20, &#39;debug_domains&#39;:=
 {}}, {&#39;SHELL&#39;: &#39;/bin/bash&#39;, &#39;BB_ENV_PASSTHROUGH_ADDITI=
ONS&#39;: &#39;MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_prox=
y all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY=
 SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGN=
ORE SOCKS5_PASSWD SOCKS5_USER WEBOS_DISTRO_BUILD_ID PSEUDO_DISABLED PSEUDO_=
BUILD&#39;, &#39;DISTRO&#39;: &#39;luneos&#39;, &#39;SSH_AUTH_SOCK&#39;: &#=
39;/tmp/ssh-XXXXXX2ZxYBo/agent.1893&#39;, &#39;SSH_AGENT_PID&#39;: &#39;189=
4&#39;, &#39;PWD&#39;: &#39;/OE/build/luneos-kirkstone&#39;, &#39;LOGNAME&#=
39;: &#39;martin&#39;, &#39;HOME&#39;: &#39;/home/martin-gentoo&#39;, &#39;=
MACHINE&#39;: &#39;qemux86-64&#39;, &#39;USER&#39;: &#39;martin&#39;, &#39;=
PATH&#39;: &#39;/OE/build/luneos-kirkstone/openembedded-core/scripts:/OE/bu=
ild/luneos-kirkstone/bitbake/bin:/home/martin-gentoo/bin:/usr/local/sbin:/u=
sr/local/bin:/usr/bin:/opt/bin:/usr/lib/llvm/17/bin:/opt/android-sdk-update=
-manager/tools:/opt/android-sdk-update-manager/platform-tools:/etc/eselect/=
wine/bin:/usr/lib64/opencascade/bin:/var/lib/snapd/snap/bin&#39;, &#39;LC_A=
LL&#39;: &#39;en_US.UTF-8&#39;, &#39;SESSION_MANAGER&#39;: &#39;local/jama:=
@/tmp/.ICE-unix/1838,unix/jama:/tmp/.ICE-unix/1838&#39;, &#39;WINDOWID&#39;=
: &#39;35651587&#39;, &#39;COLORTERM&#39;: &#39;truecolor&#39;, &#39;CSF_MD=
TVTexturesDirectory&#39;: &#39;/usr/share/opencascade/resources/Textures&#3=
9;, &#39;MACHINES&#39;: &#39;qemux86-64&#39;, &#39;XDG_CONFIG_DIRS&#39;: &#=
39;/etc/xdg&#39;, &#39;LESS&#39;: &#39;-R -M --shift 5&#39;, &#39;XDG_SESSI=
ON_PATH&#39;: &#39;/org/freedesktop/DisplayManager/Session1&#39;, &#39;XDG_=
MENU_PREFIX&#39;: &#39;xfce-&#39;, &#39;JDK_HOME&#39;: &#39;/etc/java-confi=
g-2/current-system-vm&#39;, &#39;CONFIG_PROTECT_MASK&#39;: &#39;/etc/sandbo=
x.d /etc/fonts/fonts.conf /etc/gentoo-release /etc/dconf /etc/ca-certificat=
es.conf /etc/revdep-rebuild&#39;, &#39;TERMCAP&#39;: &#39;SC|screen.xterm-2=
56color|VT 100/ANSI X3.64 virtual terminal:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\=
\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=
=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D=
\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:=
ta=3D^I:is=3D\\E)0:li#64:co#238:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%=
dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\=
\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l\\E&gt;:vi=
=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=3D\\E[?104=
9l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1=
m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4=
%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D\\140\\140aa=
ffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=3D\\E[5i:pf=
=3D\\E[4i:Z0=3D\\E[?3h:Z1=3D\\E[?3l:Km=3D\\E[&lt;:k0=3D\\E[10~:k1=3D\\EOP:k=
2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:k8=
=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z:k=
h=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=
=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:&#39;,=
 &#39;JAVA_HOME&#39;: &#39;/etc/java-config-2/current-system-vm&#39;, &#39;=
CSF_MIGRATION_TYPES&#39;: &#39;/usr/share/opencascade/resources/StdResource=
/MigrationSheet.txt&#39;, &#39;WINDOW&#39;: &#39;3&#39;, &#39;ANT_HOME&#39;=
: &#39;/usr/share/ant&#39;, &#39;DESKTOP_SESSION&#39;: &#39;xfce&#39;, &#39=
;CSF_STEPDefaults&#39;: &#39;/usr/share/opencascade/resources/XSTEPResource=
&#39;, &#39;EDITOR&#39;: &#39;vim&#39;, &#39;GTK_MODULES&#39;: &#39;canberr=
a-gtk-module&#39;, &#39;XDG_SEAT&#39;: &#39;seat0&#39;, &#39;CONFIG_PROTECT=
&#39;: &#39;/var/bind /usr/share/gnupg/qualified.txt /usr/share/easy-rsa /u=
sr/share/config /usr/lib64/libreoffice/program/sofficerc&#39;, &#39;XDG_SES=
SION_DESKTOP&#39;: &#39;XFCE&#39;, &#39;XDG_SESSION_TYPE&#39;: &#39;x11&#39=
;, &#39;PANEL_GDK_CORE_DEVICE_EVENTS&#39;: &#39;0&#39;, &#39;MANPATH&#39;: =
&#39;/etc/java-config-2/current-system-vm/man:/usr/share/gcc-data/x86_64-pc=
-linux-gnu/13/man:/usr/share/binutils-data/x86_64-pc-linux-gnu/2.41/man:/et=
c/java-config-2/current-system-vm/man/:/usr/local/share/man:/usr/share/man:=
/usr/lib/rust/man:/usr/lib/llvm/17/share/man:/etc/eselect/wine/share/man&#3=
9;, &#39;XAUTHORITY&#39;: &#39;/tmp/xauth_CEynPY&#39;, &#39;CSF_StandardLit=
eDefaults&#39;: &#39;/usr/share/opencascade/resources/StdResource&#39;, &#3=
9;OPENCL_PROFILE&#39;: &#39;nvidia&#39;, &#39;MOTD_SHOWN&#39;: &#39;pam&#39=
;, &#39;GDM_LANG&#39;: &#39;C.UTF-8&#39;, &#39;LANG&#39;: &#39;en_US.UTF-8&=
#39;, &#39;LS_COLORS&#39;: &#39;rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D4=
0;33:so=3D01;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D01;05;37;41:mi=
=3D01;05;37;41:su=3D37;41:sg=3D30;43:ca=3D00:tw=3D30;42:ow=3D34;42:st=3D37;=
44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=
=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D0=
1;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.=
dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;=
31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.=
tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=
=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01=
;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.=
wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.avif=3D01;35:*.jpg=
=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=
=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01=
;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:=
*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mp=
eg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.webp=3D01;35:*.ogm=
=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D01=
;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:*=
.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=3D=
01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D01;35=
:*.ogv=3D01;35:*.ogx=3D01;35:*.cfg=3D00;32:*.conf=3D00;32:*.diff=3D00;32:*.=
doc=3D00;32:*.ini=3D00;32:*.log=3D00;32:*.patch=3D00;32:*.pdf=3D00;32:*.ps=
=3D00;32:*.tex=3D00;32:*.txt=3D00;32:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00=
;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:=
*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=
=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:*~=3D00;90:*#=3D00;90:*.bak=3D00;90:*=
.crdownload=3D00;90:*.dpkg-dist=3D00;90:*.dpkg-new=3D00;90:*.dpkg-old=3D00;=
90:*.dpkg-tmp=3D00;90:*.old=3D00;90:*.orig=3D00;90:*.part=3D00;90:*.rej=3D0=
0;90:*.rpmnew=3D00;90:*.rpmorig=3D00;90:*.rpmsave=3D00;90:*.swp=3D00;90:*.t=
mp=3D00;90:*.ucf-dist=3D00;90:*.ucf-new=3D00;90:*.ucf-old=3D00;90:&#39;, &#=
39;XDG_CURRENT_DESKTOP&#39;: &#39;XFCE&#39;, &#39;VTE_VERSION&#39;: &#39;74=
02&#39;, &#39;CSF_GraphicShr&#39;: &#39;/usr/lib64/opencascade/libTKOpenGl.=
so&#39;, &#39;OPENGL_PROFILE&#39;: &#39;xorg-x11&#39;, &#39;XDG_SEAT_PATH&#=
39;: &#39;/org/freedesktop/DisplayManager/Seat0&#39;, &#39;QT_GRAPHICSSYSTE=
M&#39;: &#39;raster&#39;, &#39;XZ_OPT&#39;: &#39;-T0&#39;, &#39;CSF_Shaders=
Directory&#39;: &#39;/usr/share/opencascade/resources/Shaders&#39;, &#39;CS=
F_XmlOcafResource&#39;: &#39;/usr/share/opencascade/resources/XmlOcafResour=
ce&#39;, &#39;INFOPATH&#39;: &#39;/usr/share/gcc-data/x86_64-pc-linux-gnu/1=
3/info:/usr/share/binutils-data/x86_64-pc-linux-gnu/2.41/info:/usr/share/au=
toconf-2.72/info:/usr/share/autoconf-2.13/info:/usr/share/automake-1.16.5/i=
nfo:/usr/share/info&#39;, &#39;MOZ_GMP_PATH&#39;: &#39;/usr/lib64/nsbrowser=
/plugins/gmp-gmpopenh264/system-installed&#39;, &#39;CSF_SHMessage&#39;: &#=
39;/usr/share/opencascade/resources/SHMessage&#39;, &#39;JAVAC&#39;: &#39;/=
etc/java-config-2/current-system-vm/bin/javac&#39;, &#39;XDG_SESSION_CLASS&=
#39;: &#39;user&#39;, &#39;VBOX_SDK_PATH&#39;: &#39;/usr/lib64/virtualbox/s=
dk&#39;, &#39;ANDROID_HOME&#39;: &#39;/opt/android-sdk-update-manager&#39;,=
 &#39;TERM&#39;: &#39;screen.xterm-256color&#39;, &#39;VBOX_INSTALL_PATH&#3=
9;: &#39;/usr/lib64/virtualbox&#39;, &#39;LESSOPEN&#39;: &#39;|lesspipe %s&=
#39;, &#39;ANDROID_SWT&#39;: &#39;/usr/share/swt-3.7/lib&#39;, &#39;CSF_Sta=
ndardDefaults&#39;: &#39;/usr/share/opencascade/resources/StdResource&#39;,=
 &#39;CSF_IGESDefaults&#39;: &#39;/usr/share/opencascade/resources/XSTEPRes=
ource&#39;, &#39;MANPAGER&#39;: &#39;manpager&#39;, &#39;NPM_CONFIG_GLOBALC=
ONFIG&#39;: &#39;/etc/npm/npmrc&#39;, &#39;DISPLAY&#39;: &#39;:0.0&#39;, &#=
39;CSF_XCAFDefaults&#39;: &#39;/usr/share/opencascade/resources/StdResource=
&#39;, &#39;SHLVL&#39;: &#39;2&#39;, &#39;PAGER&#39;: &#39;/usr/bin/less&#3=
9;, &#39;LEX&#39;: &#39;flex&#39;, &#39;XDG_VTNR&#39;: &#39;2&#39;, &#39;CS=
F_PluginDefaults&#39;: &#39;/usr/share/opencascade/resources/StdResource&#3=
9;, &#39;XDG_SESSION_ID&#39;: &#39;2&#39;, &#39;CASROOT&#39;: &#39;/usr&#39=
;, &#39;XDG_RUNTIME_DIR&#39;: &#39;/run/user/1026&#39;, &#39;GCC_SPECS&#39;=
: &#39;&#39;, &#39;GSETTINGS_BACKEND&#39;: &#39;dconf&#39;, &#39;PS1&#39;: =
&#39;\\[\\033[01;32m\\]OE $MACHINE@$DISTRO\\[\\033[01;34m\\] \\w \\$\\[\\03=
3[00m\\] &#39;, &#39;CSF_XSMessage&#39;: &#39;/usr/share/opencascade/resour=
ces/XSMessage&#39;, &#39;XDG_DATA_DIRS&#39;: &#39;/usr/local/share:/usr/sha=
re:/etc/eselect/wine/share:/var/lib/snapd/desktop&#39;, &#39;CSF_UnitsDefin=
ition&#39;: &#39;/usr/share/opencascade/resources/UnitsAPI/Units.dat&#39;, =
&#39;STY&#39;: &#39;2067.x&#39;, &#39;VBOX_APP_HOME&#39;: &#39;/usr/lib64/v=
irtualbox&#39;, &#39;DBUS_SESSION_BUS_ADDRESS&#39;: &#39;unix:path=3D/run/u=
ser/1026/bus&#39;, &#39;INITPWD&#39;: &#39;/OE/build/luneos-kirkstone&#39;,=
 &#39;MAIL&#39;: &#39;/var/mail/martin&#39;, &#39;OLDPWD&#39;: &#39;/home/m=
artin-gentoo&#39;, &#39;_&#39;: &#39;/OE/build/luneos-kirkstone/bitbake/bin=
/bitbake&#39;}, [&#39;/OE/build/luneos-kirkstone/bitbake/bin/bitbake&#39;, =
&#39;-k&#39;, &#39;zlib-native&#39;]]<br>/OE/build/luneos-kirkstone/bitbake=
/lib/bb/codeparser.py:228: DeprecationWarning: ast.Str is deprecated and wi=
ll be removed in Python 3.14; use ast.Constant instead<br>=C2=A0 if isinsta=
nce(node.args[0], ast.Str): =C2=A0<br>/OE/build/luneos-kirkstone/bitbake/li=
b/bb/codeparser.py:229: DeprecationWarning: Attribute s is deprecated and w=
ill be removed in Python 3.14; use value instead<br>=C2=A0 varname =3D node=
.args[0].s<br>/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:230: =
DeprecationWarning: ast.Str is deprecated and will be removed in Python 3.1=
4; use ast.Constant instead<br>=C2=A0 if name in self.containsfuncs and isi=
nstance(node.args[1], ast.Str):<br>/OE/build/luneos-kirkstone/bitbake/lib/b=
b/codeparser.py:233: DeprecationWarning: Attribute s is deprecated and will=
 be removed in Python 3.14; use value instead<br>=C2=A0 self.contains[varna=
me].add(node.args[1].s)<br>/usr/lib/python3.12/multiprocessing/popen_fork.p=
y:66: DeprecationWarning: This process (pid=3D4184584) is multi-threaded, u=
se of fork() may lead to deadlocks in the child.<br>=C2=A0 self.pid =3D os.=
fork()<br>4184584 16:47:45.108449 Command Completed<br>4184584 16:47:45.112=
267 Running command [&#39;getVariable&#39;, &#39;BBINCLUDELOGS&#39;]<br>418=
4584 16:47:45.113080 Command Completed<br>4184584 16:47:45.113399 Running c=
ommand [&#39;getVariable&#39;, &#39;BBINCLUDELOGS_LINES&#39;]<br><div>41845=
84 16:47:45.113925 Command Completed<br>4184584 16:47:45.114218 Running com=
mand [&#39;getSetVariable&#39;, &#39;BB_CONSOLELOG&#39;]<br>4184584 16:47:4=
5.114956 Command Completed<br>4184584 16:47:45.115441 Running command [&#39=
;getSetVariable&#39;, &#39;BB_LOGCONFIG&#39;]<br>4184584 16:47:45.116590 Co=
mmand Completed<br>4184584 16:47:45.122232 Running command [&#39;getUIHandl=
erNum&#39;]<br>4184584 16:47:45.122805 Command Completed<br>4184584 16:47:4=
5.123194 Running command [&#39;setEventMask&#39;, 1, 20, {&#39;BitBake.SigG=
en.HashEquiv&#39;: 19, &#39;BitBake.RunQueue.HashEquiv&#39;: 19}, [&#39;bb.=
runqueue.runQueueExitWait&#39;, &#39;bb.event.LogExecTTY&#39;, &#39;logging=
.LogRecord&#39;, &#39;bb.build.TaskFailed&#39;, &#39;bb.build.TaskBase&#39;=
, &#39;bb.event.ParseStarted&#39;, &#39;bb.event.ParseProgress&#39;, &#39;b=
b.event.ParseCompleted&#39;, &#39;bb.event.CacheLoadStarted&#39;, &#39;bb.e=
vent.CacheLoadProgress&#39;, &#39;bb.event.CacheLoadCompleted&#39;, &#39;bb=
.command.CommandFailed&#39;, &#39;bb.command.CommandExit&#39;, &#39;bb.comm=
and.CommandCompleted&#39;, &#39;bb.cooker.CookerExit&#39;, &#39;bb.event.Mu=
ltipleProviders&#39;, &#39;bb.event.NoProvider&#39;, &#39;bb.runqueue.scene=
QueueTaskStarted&#39;, &#39;bb.runqueue.runQueueTaskStarted&#39;, &#39;bb.r=
unqueue.runQueueTaskFailed&#39;, &#39;bb.runqueue.sceneQueueTaskFailed&#39;=
, &#39;bb.event.BuildBase&#39;, &#39;bb.build.TaskStarted&#39;, &#39;bb.bui=
ld.TaskSucceeded&#39;, &#39;bb.build.TaskFailedSilent&#39;, &#39;bb.build.T=
askProgress&#39;, &#39;bb.event.ProcessStarted&#39;, &#39;bb.event.ProcessP=
rogress&#39;, &#39;bb.event.ProcessFinished&#39;]]<br>4184584 16:47:45.1235=
58 Command Completed<br>4184584 16:47:45.123863 Running command [&#39;getVa=
riable&#39;, &#39;BB_DEFAULT_TASK&#39;]<br>4184584 16:47:45.124228 Command =
Completed<br>4184584 16:47:45.124528 Running command [&#39;setConfig&#39;, =
&#39;cmd&#39;, &#39;build&#39;]<br>4184584 16:47:45.124858 Command Complete=
d<br>4184584 16:47:45.125140 Running command [&#39;buildTargets&#39;, [&#39=
;zlib-native&#39;], &#39;build&#39;]<br>4184584 16:47:45.125294 Command Com=
pleted<br>/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228: Depr=
ecationWarning: ast.Str is deprecated and will be removed in Python 3.14; u=
se ast.Constant instead<br>=C2=A0 if isinstance(node.args[0], ast.Str): =C2=
=A0<br>/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229: Depreca=
tionWarning: Attribute s is deprecated and will be removed in Python 3.14; =
use value instead<br>=C2=A0 varname =3D node.args[0].s<br>/OE/build/luneos-=
kirkstone/bitbake/lib/bb/codeparser.py:230: DeprecationWarning: ast.Str is =
deprecated and will be removed in Python 3.14; use ast.Constant instead<br>=
=C2=A0 if name in self.containsfuncs and isinstance(node.args[1], ast.Str):=
<br>/OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:233: Deprecatio=
nWarning: Attribute s is deprecated and will be removed in Python 3.14; use=
 value instead<br>=C2=A0 self.contains[varname].add(node.args[1].s)<br>/usr=
/lib/python3.12/asyncio/streams.py:413: ResourceWarning: unclosed &lt;Strea=
mWriter transport=3D&lt;_SelectorSocketTransport closing fd=3D18 read=3Didl=
e write=3D&lt;idle, bufsize=3D0&gt;&gt; reader=3D&lt;StreamReader transport=
=3D&lt;_SelectorSocketTransport closing fd=3D18 read=3Didle write=3D&lt;idl=
e, bufsize=3D0&gt;&gt;&gt;&gt; =C2=A0 <br>=C2=A0 warnings.warn(f&quot;unclo=
sed {self!r}&quot;, ResourceWarning)<br>/OE/build/luneos-kirkstone/bitbake/=
lib/bb/codeparser.py:228: DeprecationWarning: ast.Str is deprecated and wil=
l be removed in Python 3.14; use ast.Constant instead<br>=C2=A0 if isinstan=
ce(node.args[0], ast.Str): =C2=A0<br>/OE/build/luneos-kirkstone/bitbake/lib=
/bb/codeparser.py:229: DeprecationWarning: Attribute s is deprecated and wi=
ll be removed in Python 3.14; use value instead<br>=C2=A0 varname =3D node.=
args[0].s<br>4184584 16:48:37.909973 Processing Client<br>4184584 16:48:37.=
910125 Disconnecting Client<br>4184584 16:48:37.910729 No timeout, exiting.=
<br>4184584 16:48:38.011341 Exiting<br></div></div><div><br></div><div>It i=
s reproducible with nanbield as well and fixed in scarthgap, will bisect it=
 when time allows.</div><div><br></div><div>Regards,</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 31, 2=
023 at 11:03=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">For what it&#39;s wort=
h, I am not seeing any of these issues (hanging<br>
processes after bitbake exit, timeouts on world builds with all<br>
meta-oe-layers) with python 3.12 provided by buildtools-tarball. The<br>
issues are probably real, but it&#39;s also possible python 3.12 per se is<=
br>
not to blame.<br>
<br>
It would probably help if you check if what you&#39;re seeing occurs with<b=
r>
python 3.12 from the tarball, which you can build from this branch:<br>
<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/py3.=
12" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-=
contrib/log/?h=3Dakanavin/py3.12</a><br>
(the log in the web ui isn&#39;t updated yet, I just pushed)<br>
<br>
Alex<br>
<br>
On Fri, 22 Dec 2023 at 00:06, Randy MacLeod via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a><br>
&lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.openembedded.org"=
 target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 2023-12-21 1:56 p.m., Martin Jansa wrote:<br>
&gt;<br>
&gt; On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM Randy MacLeod &lt;<a href=3D"m=
ailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windrive=
r.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt;&gt;<br>
&gt;&gt; So it&#39;s not just Fedora, but Python 3.12 in general.<br>
&gt;&gt;<br>
&gt;&gt; Googling for problem with threads + fork reveals that<br>
&gt;&gt; it is indeed an issue even in C / POSIX: only the thread<br>
&gt;&gt; executing fork() will become part of the new process,<br>
&gt;&gt; but not the main process starting the thread or any<br>
&gt;&gt; other threads from the original process.<br>
&gt;&gt;<br>
&gt;&gt; The warning is justified, and apparently the issue<br>
&gt;&gt; not occurring in bitbake with previous Python versions<br>
&gt;&gt; is pure luck.<br>
&gt;&gt;<br>
&gt;&gt; FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or la=
ter.<br>
&gt;<br>
&gt;<br>
&gt; But this fixes it only for bitbake master, right?<br>
&gt;<br>
&gt; Even master might still have some problems.<br>
&gt; I can do a simple build of a package but in doing:<br>
&gt;<br>
&gt; $ bitbake -k world<br>
&gt;<br>
&gt; I see:<br>
&gt; NOTE: No reply from server in 30s (for command ping at 17:50:35.510798=
)<br>
&gt;<br>
&gt; After some time.<br>
&gt;<br>
&gt; I&#39;m not going to try to debug it at this point in the day/year!<br=
>
&gt;<br>
&gt;<br>
&gt; With bitbake 2.0 used in kirkstone I still see bitbake processes still=
 running after the build is finished.<br>
&gt;<br>
&gt; I didn&#39;t try kirkstone. Maybe Steve has that on his list of things=
 to do in his spare time! ;-)<br>
&gt;<br>
&gt; ../Randy<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; # Randy MacLeod<br>
&gt; # Wind River Linux<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#192854): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/192854" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/192854</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10282618=
6/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102826186/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000000077fe060e3506bb--


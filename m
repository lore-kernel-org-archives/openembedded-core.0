Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E67DC3DA6E
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 02:21:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.41471.1704507667729007175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 18:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tXujlCsC;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d5336986cso2054085e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 18:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704507666; x=1705112466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmcPCNbUJRQ1KPPrTEKngsy2UwAaUaSBF2Zc5m/zRQI=;
        b=tXujlCsCseWZ0N8oxEXzvrxXnkhsU1dNgycV7WNInexAXLwTu43hamEbha5zNznjJX
         g+KKZ7sESAuXYD2RUoBBlzRnQ8slwAh1DRtSX8q0iDmZhigq/H+jGdsWl0SSUIwg4xa3
         NFr0ZX98KGWi3u8xGZzzG0Lfr35w3rv99GkYTURKP3ZwzbXpSRHMQrPXfg13tzNVahHq
         J5jXzfTrWMPgeME5C617hxAlHEbo/CFl17A0ZuGUdXWrZLEIKuenC1yvCsE2xwu3uYSU
         Flh5lF/J0gaVQ0ixXcdh05nJbbH9IC+L155wKXGtrztAyvBNB1W0FwtkEN9je1Nl6Vpd
         pA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704507666; x=1705112466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmcPCNbUJRQ1KPPrTEKngsy2UwAaUaSBF2Zc5m/zRQI=;
        b=nRjsLVzdt7S/f4OE3ymzQONKEVhiqDx8kROP+7wm5m6K9pOGgVHPdAEIbK/TZeUVbY
         p7KCEa2crCK9SYZMSL8xaumSNeagepXs83CccSMg4Qe78jT3QCAz7gyKBg9FOus2B2fB
         Xk/srtMnNCTmJN2DncAWjpGTnmDiwLriZ/38NTeJc8Ga+8w5m+xD+62kxLTkZ8z8MTr8
         3JSguOpwEICY9I7h5/48FGUj6kn9rYaR0+RIhkOuTYINWLG9NAO9Ur/FvYh5PJJFUXlB
         AxKiRd9ONkJlXrZ8IFVirBYSLYA5zGV2xy/REt3PUQRiHVeTHfRsi9xAz8uJlae+a0La
         S8XA==
X-Gm-Message-State: AOJu0YyfGGktOzPt6FIpI3EEihwuP/+o/2StTonTO8wTDSE3qgAeYC01
	BpF6ms4D+HHaB1bgXv9+kV/S7Ho6WU8aXGi7G7KS/GEKWtlqng==
X-Google-Smtp-Source: AGHT+IHYIjtdCwZUQD9h5ZShTSykPF4gq9LCJLHxYtOY6ks4SUBfre/hd6bJi9Lsk7YnsueJmSGS4c+ZRTYJbWnvatY=
X-Received: by 2002:a7b:c3d7:0:b0:40c:6d5f:e88c with SMTP id
 t23-20020a7bc3d7000000b0040c6d5fe88cmr154967wmj.185.1704507665732; Fri, 05
 Jan 2024 18:21:05 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com> <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com> <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
 <CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp5NAPL56yow7bPAjSBngw@mail.gmail.com>
 <d11ce5f1-161b-4bd2-9bc5-2bd12d7659a9@windriver.com> <CANNYZj_L=rEwhgdWLchdzHYgdWMrkZ4rizCKvmF8hXotBcKgnw@mail.gmail.com>
 <17A77F200F38338C.25044@lists.openembedded.org> <CA+chaQdtbiAfrL9+05Le2B-ZUTr5OAfG8oS75AtqP4o4kjWeyQ@mail.gmail.com>
 <17A7822E21CAE9E6.25044@lists.openembedded.org>
In-Reply-To: <17A7822E21CAE9E6.25044@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 5 Jan 2024 16:20:54 -1000
Message-ID: <CAOSpxdZPgKbre9HHzYP7mJ9qPpQNzQkNqy_yGnAwRoBpmAbVvg@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: steve@sakoman.com
Cc: Martin Jansa <martin.jansa@gmail.com>, Joshua Watt <jpewhacker@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, randy.macleod@windriver.com, zboszor@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jan 2024 02:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193380

On Fri, Jan 5, 2024 at 7:02=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Fri, Jan 5, 2024 at 6:54=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >
> > On Fri, Jan 5, 2024 at 5:06=E2=80=AFPM Martin Jansa via lists.openembed=
ded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> FWIW: I see the processes running after bitbake exit only in kirkstone=
 and only with
> >> PRSERV_HOST =3D "localhost:0"
> >> if I drop PRSERV_HOST then all 3 bitbake-server processes exist togeth=
er with bitbake itself.
> >>
> >> luneos-kirkstone $ rm -f bitbake-cookerdaemon.log
> >> luneos-kirkstone $ ps aux | grep luneos-kirkstone
> >> martin   4184043  0.0  0.0   9124  2048 pts/4    S+   16:47   0:00 gre=
p --colour=3Dauto luneos-kirkstone
> >> luneos-kirkstone $ bitbake -k zlib-native
> >> NOTE: Started PRServer with DBfile: /OE/build/luneos-kirkstone/cache/p=
rserv.sqlite3, Address: 127.0.0.1:35811, PID: 4184924
> >> Loading cache: 100% |#################################################=
###########################################################################=
###########################################################################=
###| Time: 0:00:04
> >> Loaded 4570 entries from dependency cache.
> >> ...
> >> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 11 (100%=
 match, 100% complete)
> >> NOTE: Executing Tasks
> >> NOTE: Tasks Summary: Attempted 92 tasks of which 92 didn't need to be =
rerun and all succeeded.
> >> NOTE: Writing buildhistory
> >> NOTE: Writing buildhistory took: 15 seconds
> >> luneos-kirkstone $ ps aux | grep luneos-kirkstone
> >> martin     51324  0.0  0.0   9124  2048 pts/4    S+   16:54   0:00 gre=
p --colour=3Dauto luneos-kirkstone
> >> martin   4184584  8.9  0.4 668196 536892 ?       Sl   16:47   0:37 bit=
bake-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server decafbad =
3 5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log /OE/build/luneos-ki=
rkstone/bitbake.lock /OE/build/luneos-kirkstone/bitbake.sock 0 None 0
> >> martin   4184924  0.0  0.1 340280 196428 ?       S    16:47   0:00 bit=
bake-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server decafbad =
3 5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log /OE/build/luneos-ki=
rkstone/bitbake.lock /OE/build/luneos-kirkstone/bitbake.sock 0 None 0
> >> martin   4184927  0.0  0.1 340328 194440 ?       S    16:47   0:00 bit=
bake-server /OE/build/luneos-kirkstone/bitbake/bin/bitbake-server decafbad =
3 5 /OE/build/luneos-kirkstone/bitbake-cookerdaemon.log /OE/build/luneos-ki=
rkstone/bitbake.lock /OE/build/luneos-kirkstone/bitbake.sock 0 None 0
> >>
> >> luneos-kirkstone $ cat bitbake-cookerdaemon.log
> >> 4184584 16:47:38.367593 --- Starting bitbake server pid 4184584 at 202=
4-01-05 16:47:38.367526 ---
> >> 4184584 16:47:38.370315 Started bitbake server pid 4184584
> >> 4184584 16:47:38.370831 Entering server connection loop
> >> 4184584 16:47:38.372043 Accepting [<socket.socket fd=3D6, family=3D1, =
type=3D1, proto=3D0, laddr=3Dbitbake.sock>] ([])
> >> 4184584 16:47:38.376431 Processing Client
> >> 4184584 16:47:38.376633 Connecting Client
> >> 4184584 16:47:38.377632 Running command ['setFeatures', [2, 1]]
> >> 4184584 16:47:38.379355 Command Completed
> >> 4184584 16:47:38.379868 Running command ['updateConfig', {'halt': Fals=
e, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signat=
ures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'p=
ostfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': =
False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventl=
og': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'de=
fault_loglevel': 20, 'debug_domains': {}}, {'SHELL': '/bin/bash', 'BB_ENV_P=
ASSTHROUGH_ADDITIONS': 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy h=
ttps_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCR=
EV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_=
PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER WEBOS_DISTRO_BUILD_ID PSEUDO_DISABLE=
D PSEUDO_BUILD', 'DISTRO': 'luneos', 'SSH_AUTH_SOCK': '/tmp/ssh-XXXXXX2ZxYB=
o/agent.1893', 'SSH_AGENT_PID': '1894', 'PWD': '/OE/build/luneos-kirkstone'=
, 'LOGNAME': 'martin', 'HOME': '/home/martin-gentoo', 'MACHINE': 'qemux86-6=
4', 'USER': 'martin', 'PATH': '/OE/build/luneos-kirkstone/openembedded-core=
/scripts:/OE/build/luneos-kirkstone/bitbake/bin:/home/martin-gentoo/bin:/us=
r/local/sbin:/usr/local/bin:/usr/bin:/opt/bin:/usr/lib/llvm/17/bin:/opt/and=
roid-sdk-update-manager/tools:/opt/android-sdk-update-manager/platform-tool=
s:/etc/eselect/wine/bin:/usr/lib64/opencascade/bin:/var/lib/snapd/snap/bin'=
, 'LC_ALL': 'en_US.UTF-8', 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/1=
838,unix/jama:/tmp/.ICE-unix/1838', 'WINDOWID': '35651587', 'COLORTERM': 't=
ruecolor', 'CSF_MDTVTexturesDirectory': '/usr/share/opencascade/resources/T=
extures', 'MACHINES': 'qemux86-64', 'XDG_CONFIG_DIRS': '/etc/xdg', 'LESS': =
'-R -M --shift 5', 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Ses=
sion1', 'XDG_MENU_PREFIX': 'xfce-', 'JDK_HOME': '/etc/java-config-2/current=
-system-vm', 'CONFIG_PROTECT_MASK': '/etc/sandbox.d /etc/fonts/fonts.conf /=
etc/gentoo-release /etc/dconf /etc/ca-certificates.conf /etc/revdep-rebuild=
', 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual terminal:=
DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\\E[=
J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D\\E=
[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:cr=
=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#64:co#238:am:xn:xv:LP=
:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[%d=
M:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\E[=
?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34l:=
ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=3D\=
\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co#8:p=
a#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\\E(0=
:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~=
..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Z0=3D\\E[?3h:Z1=3D\\E[?3l:Km=3D\\E[<=
:k0=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=
=3D\\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~=
:F2=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=
=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\=
EOC:kl=3D\\EOD:km:', 'JAVA_HOME': '/etc/java-config-2/current-system-vm', '=
CSF_MIGRATION_TYPES': '/usr/share/opencascade/resources/StdResource/Migrati=
onSheet.txt', 'WINDOW': '3', 'ANT_HOME': '/usr/share/ant', 'DESKTOP_SESSION=
': 'xfce', 'CSF_STEPDefaults': '/usr/share/opencascade/resources/XSTEPResou=
rce', 'EDITOR': 'vim', 'GTK_MODULES': 'canberra-gtk-module', 'XDG_SEAT': 's=
eat0', 'CONFIG_PROTECT': '/var/bind /usr/share/gnupg/qualified.txt /usr/sha=
re/easy-rsa /usr/share/config /usr/lib64/libreoffice/program/sofficerc', 'X=
DG_SESSION_DESKTOP': 'XFCE', 'XDG_SESSION_TYPE': 'x11', 'PANEL_GDK_CORE_DEV=
ICE_EVENTS': '0', 'MANPATH': '/etc/java-config-2/current-system-vm/man:/usr=
/share/gcc-data/x86_64-pc-linux-gnu/13/man:/usr/share/binutils-data/x86_64-=
pc-linux-gnu/2.41/man:/etc/java-config-2/current-system-vm/man/:/usr/local/=
share/man:/usr/share/man:/usr/lib/rust/man:/usr/lib/llvm/17/share/man:/etc/=
eselect/wine/share/man', 'XAUTHORITY': '/tmp/xauth_CEynPY', 'CSF_StandardLi=
teDefaults': '/usr/share/opencascade/resources/StdResource', 'OPENCL_PROFIL=
E': 'nvidia', 'MOTD_SHOWN': 'pam', 'GDM_LANG': 'C.UTF-8', 'LANG': 'en_US.UT=
F-8', 'LS_COLORS': 'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01=
;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D01;05;37;41:mi=3D01;05;37;4=
1:su=3D37;41:sg=3D30;43:ca=3D00:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32=
:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lh=
a=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D=
01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.=
gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01=
;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:=
*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=
=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01=
;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.=
swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.avif=3D01;35:*.jpg=3D01;35:*.jpeg=
=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=
=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01=
;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35=
:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m=
2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=
=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01=
;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*=
.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D=
01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35=
:*.ogx=3D01;35:*.cfg=3D00;32:*.conf=3D00;32:*.diff=3D00;32:*.doc=3D00;32:*.=
ini=3D00;32:*.log=3D00;32:*.patch=3D00;32:*.pdf=3D00;32:*.ps=3D00;32:*.tex=
=3D00;32:*.txt=3D00;32:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D00=
;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:=
*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=
=3D00;36:*.xspf=3D00;36:*~=3D00;90:*#=3D00;90:*.bak=3D00;90:*.crdownload=3D=
00;90:*.dpkg-dist=3D00;90:*.dpkg-new=3D00;90:*.dpkg-old=3D00;90:*.dpkg-tmp=
=3D00;90:*.old=3D00;90:*.orig=3D00;90:*.part=3D00;90:*.rej=3D00;90:*.rpmnew=
=3D00;90:*.rpmorig=3D00;90:*.rpmsave=3D00;90:*.swp=3D00;90:*.tmp=3D00;90:*.=
ucf-dist=3D00;90:*.ucf-new=3D00;90:*.ucf-old=3D00;90:', 'XDG_CURRENT_DESKTO=
P': 'XFCE', 'VTE_VERSION': '7402', 'CSF_GraphicShr': '/usr/lib64/opencascad=
e/libTKOpenGl.so', 'OPENGL_PROFILE': 'xorg-x11', 'XDG_SEAT_PATH': '/org/fre=
edesktop/DisplayManager/Seat0', 'QT_GRAPHICSSYSTEM': 'raster', 'XZ_OPT': '-=
T0', 'CSF_ShadersDirectory': '/usr/share/opencascade/resources/Shaders', 'C=
SF_XmlOcafResource': '/usr/share/opencascade/resources/XmlOcafResource', 'I=
NFOPATH': '/usr/share/gcc-data/x86_64-pc-linux-gnu/13/info:/usr/share/binut=
ils-data/x86_64-pc-linux-gnu/2.41/info:/usr/share/autoconf-2.72/info:/usr/s=
hare/autoconf-2.13/info:/usr/share/automake-1.16.5/info:/usr/share/info', '=
MOZ_GMP_PATH': '/usr/lib64/nsbrowser/plugins/gmp-gmpopenh264/system-install=
ed', 'CSF_SHMessage': '/usr/share/opencascade/resources/SHMessage', 'JAVAC'=
: '/etc/java-config-2/current-system-vm/bin/javac', 'XDG_SESSION_CLASS': 'u=
ser', 'VBOX_SDK_PATH': '/usr/lib64/virtualbox/sdk', 'ANDROID_HOME': '/opt/a=
ndroid-sdk-update-manager', 'TERM': 'screen.xterm-256color', 'VBOX_INSTALL_=
PATH': '/usr/lib64/virtualbox', 'LESSOPEN': '|lesspipe %s', 'ANDROID_SWT': =
'/usr/share/swt-3.7/lib', 'CSF_StandardDefaults': '/usr/share/opencascade/r=
esources/StdResource', 'CSF_IGESDefaults': '/usr/share/opencascade/resource=
s/XSTEPResource', 'MANPAGER': 'manpager', 'NPM_CONFIG_GLOBALCONFIG': '/etc/=
npm/npmrc', 'DISPLAY': ':0.0', 'CSF_XCAFDefaults': '/usr/share/opencascade/=
resources/StdResource', 'SHLVL': '2', 'PAGER': '/usr/bin/less', 'LEX': 'fle=
x', 'XDG_VTNR': '2', 'CSF_PluginDefaults': '/usr/share/opencascade/resource=
s/StdResource', 'XDG_SESSION_ID': '2', 'CASROOT': '/usr', 'XDG_RUNTIME_DIR'=
: '/run/user/1026', 'GCC_SPECS': '', 'GSETTINGS_BACKEND': 'dconf', 'PS1': '=
\\[\\033[01;32m\\]OE $MACHINE@$DISTRO\\[\\033[01;34m\\] \\w \\$\\[\\033[00m=
\\] ', 'CSF_XSMessage': '/usr/share/opencascade/resources/XSMessage', 'XDG_=
DATA_DIRS': '/usr/local/share:/usr/share:/etc/eselect/wine/share:/var/lib/s=
napd/desktop', 'CSF_UnitsDefinition': '/usr/share/opencascade/resources/Uni=
tsAPI/Units.dat', 'STY': '2067.x', 'VBOX_APP_HOME': '/usr/lib64/virtualbox'=
, 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=3D/run/user/1026/bus', 'INITPWD': =
'/OE/build/luneos-kirkstone', 'MAIL': '/var/mail/martin', 'OLDPWD': '/home/=
martin-gentoo', '_': '/OE/build/luneos-kirkstone/bitbake/bin/bitbake'}, ['/=
OE/build/luneos-kirkstone/bitbake/bin/bitbake', '-k', 'zlib-native']]
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228: Deprecati=
onWarning: ast.Str is deprecated and will be removed in Python 3.14; use as=
t.Constant instead
> >>   if isinstance(node.args[0], ast.Str):
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229: Deprecati=
onWarning: Attribute s is deprecated and will be removed in Python 3.14; us=
e value instead
> >>   varname =3D node.args[0].s
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:230: Deprecati=
onWarning: ast.Str is deprecated and will be removed in Python 3.14; use as=
t.Constant instead
> >>   if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:233: Deprecati=
onWarning: Attribute s is deprecated and will be removed in Python 3.14; us=
e value instead
> >>   self.contains[varname].add(node.args[1].s)
> >> /usr/lib/python3.12/multiprocessing/popen_fork.py:66: DeprecationWarni=
ng: This process (pid=3D4184584) is multi-threaded, use of fork() may lead =
to deadlocks in the child.
> >>   self.pid =3D os.fork()
> >> 4184584 16:47:45.108449 Command Completed
> >> 4184584 16:47:45.112267 Running command ['getVariable', 'BBINCLUDELOGS=
']
> >> 4184584 16:47:45.113080 Command Completed
> >> 4184584 16:47:45.113399 Running command ['getVariable', 'BBINCLUDELOGS=
_LINES']
> >> 4184584 16:47:45.113925 Command Completed
> >> 4184584 16:47:45.114218 Running command ['getSetVariable', 'BB_CONSOLE=
LOG']
> >> 4184584 16:47:45.114956 Command Completed
> >> 4184584 16:47:45.115441 Running command ['getSetVariable', 'BB_LOGCONF=
IG']
> >> 4184584 16:47:45.116590 Command Completed
> >> 4184584 16:47:45.122232 Running command ['getUIHandlerNum']
> >> 4184584 16:47:45.122805 Command Completed
> >> 4184584 16:47:45.123194 Running command ['setEventMask', 1, 20, {'BitB=
ake.SigGen.HashEquiv': 19, 'BitBake.RunQueue.HashEquiv': 19}, ['bb.runqueue=
.runQueueExitWait', 'bb.event.LogExecTTY', 'logging.LogRecord', 'bb.build.T=
askFailed', 'bb.build.TaskBase', 'bb.event.ParseStarted', 'bb.event.ParsePr=
ogress', 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted', 'bb.event.=
CacheLoadProgress', 'bb.event.CacheLoadCompleted', 'bb.command.CommandFaile=
d', 'bb.command.CommandExit', 'bb.command.CommandCompleted', 'bb.cooker.Coo=
kerExit', 'bb.event.MultipleProviders', 'bb.event.NoProvider', 'bb.runqueue=
.sceneQueueTaskStarted', 'bb.runqueue.runQueueTaskStarted', 'bb.runqueue.ru=
nQueueTaskFailed', 'bb.runqueue.sceneQueueTaskFailed', 'bb.event.BuildBase'=
, 'bb.build.TaskStarted', 'bb.build.TaskSucceeded', 'bb.build.TaskFailedSil=
ent', 'bb.build.TaskProgress', 'bb.event.ProcessStarted', 'bb.event.Process=
Progress', 'bb.event.ProcessFinished']]
> >> 4184584 16:47:45.123558 Command Completed
> >> 4184584 16:47:45.123863 Running command ['getVariable', 'BB_DEFAULT_TA=
SK']
> >> 4184584 16:47:45.124228 Command Completed
> >> 4184584 16:47:45.124528 Running command ['setConfig', 'cmd', 'build']
> >> 4184584 16:47:45.124858 Command Completed
> >> 4184584 16:47:45.125140 Running command ['buildTargets', ['zlib-native=
'], 'build']
> >> 4184584 16:47:45.125294 Command Completed
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228: Deprecati=
onWarning: ast.Str is deprecated and will be removed in Python 3.14; use as=
t.Constant instead
> >>   if isinstance(node.args[0], ast.Str):
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229: Deprecati=
onWarning: Attribute s is deprecated and will be removed in Python 3.14; us=
e value instead
> >>   varname =3D node.args[0].s
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:230: Deprecati=
onWarning: ast.Str is deprecated and will be removed in Python 3.14; use as=
t.Constant instead
> >>   if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:233: Deprecati=
onWarning: Attribute s is deprecated and will be removed in Python 3.14; us=
e value instead
> >>   self.contains[varname].add(node.args[1].s)
> >> /usr/lib/python3.12/asyncio/streams.py:413: ResourceWarning: unclosed =
<StreamWriter transport=3D<_SelectorSocketTransport closing fd=3D18 read=3D=
idle write=3D<idle, bufsize=3D0>> reader=3D<StreamReader transport=3D<_Sele=
ctorSocketTransport closing fd=3D18 read=3Didle write=3D<idle, bufsize=3D0>=
>>>
> >>   warnings.warn(f"unclosed {self!r}", ResourceWarning)
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:228: Deprecati=
onWarning: ast.Str is deprecated and will be removed in Python 3.14; use as=
t.Constant instead
> >>   if isinstance(node.args[0], ast.Str):
> >> /OE/build/luneos-kirkstone/bitbake/lib/bb/codeparser.py:229: Deprecati=
onWarning: Attribute s is deprecated and will be removed in Python 3.14; us=
e value instead
> >>   varname =3D node.args[0].s
> >> 4184584 16:48:37.909973 Processing Client
> >> 4184584 16:48:37.910125 Disconnecting Client
> >> 4184584 16:48:37.910729 No timeout, exiting.
> >> 4184584 16:48:38.011341 Exiting
> >>
> >> It is reproducible with nanbield as well and fixed in scarthgap, will =
bisect it when time allows.
> >
> >
> > bisect was simpler than expected as nanbield is still compatible with n=
ewer bitbake and there weren't that many changes.
> >
> > nanbield as well as kirkstone can be fixed by cherry-picking:
> > https://git.openembedded.org/bitbake/commit/?id=3Dd01d684a0 asyncrpc: A=
dd context manager API
> >
> > + Joshua if he sees some risks in cherry-picking this to stable release=
s.
>
> While we wait for Joshua to comment I'll do a little autobuilder
> testing to see if anything blows up with this patch.

FWIW, a-full autobuilder runs for both nanbield and kirkstone with
this patch came back all green.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193373): https://lists.openembedded.org/g/openembedde=
d-core/message/193373
> Mute This Topic: https://lists.openembedded.org/mt/102826186/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


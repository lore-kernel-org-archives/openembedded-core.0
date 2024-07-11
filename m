Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388B0C3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 09:26:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.7885.1720689994796029498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 02:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cEmgS0xB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso10317205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 02:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720689993; x=1721294793; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eh3emcX7sZeE0Y6XmlduiC+Pzqfrc1MOzQ3iCy20Rzo=;
        b=cEmgS0xBfoprV81TjJiUYu26W5OeWNeXXazq8HglkqzX/1I6SNnotmMTo5x6Q5j9Fd
         IaSE3cOWfTh0NbZh+3kXiwXVXsDoyOCRO1LB/KAT6xcq8PxAYgKJTH9lpS85EwMUuYa/
         YOymhzgVjh3YS32kEVK9uw6+JQK8m8KJKSrdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720689993; x=1721294793;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh3emcX7sZeE0Y6XmlduiC+Pzqfrc1MOzQ3iCy20Rzo=;
        b=NXVGpsAzXzXl9vp2LkojgSd6x2yjFuXMiGRgyJzPA8JyVZFFaffQG8hxTNBsiPxMbA
         O9ACLNgUX2f/6gdpG6vAteL6NG8bAfqZqtOfvUnX9uM26Hw2+G83OEQ9sz2VUimjFOj5
         jwXhprQPdbepEHlwxPQqOGJ9oiJ6o6zW4iS9DYu1OlNbwj29lBFK4NLI9d/bEURkRort
         rngzpLSvoz0AG8AeJo4P27sZu0rEdIhFpEpVUoQJ2lO7Hl7/sNYXYWuhN7uVxsqCIl+y
         x39dej6tlL3g9b4N5qQGQC3XoQ50gjUuOEWAauuyHZD5Sflyv3oComRFvEyydd8E2/d9
         ZSOg==
X-Gm-Message-State: AOJu0YwHVvrYk3W/tSTZpJ56YmSJt+LAlN5QvbwH5Eafw63pkKSSnkLN
	CUcj2LEcb9X9+IwO9SkwKbrYbjMdmZ9vU0iyMQTVDLuJQw3IfU2kSF6D/G0mEgPOGljbBL2B/OR
	a
X-Google-Smtp-Source: AGHT+IEJD3EzI0Q2Jun5cbiDzIi3GVrBO4F/S8fen5jv12xxZtP4J+gLlF2BjGy4wV9ai4hHcpgrgw==
X-Received: by 2002:a05:600c:4811:b0:426:5b52:84fb with SMTP id 5b1f17b1804b1-427981ba628mr17794675e9.7.1720689992633;
        Thu, 11 Jul 2024 02:26:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6? ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde846dfsm7206222f8f.28.2024.07.11.02.26.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:26:32 -0700 (PDT)
Message-ID: <a4b60ebebcc5988c2050e81bb25247f5a69cb5eb.camel@linuxfoundation.org>
Subject: Autobuilder build space breakdown for a sample core world build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2024 10:26:31 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201770

We've been seeing increasing space problems on the autobuilder so we
need to track down "what changed?". A musl-qemux86-64 build (of oe-core
world) is using 240GB and I did a bit of searching to see where the
space was being used. In tmp:

4.0K	abi_version
79M	buildstats
37M	cache
28G	deploy
136K	hosttools
312M	log
154M	pkgdata
4.0K	qa.log
4.0K	saved_tmpdir
224M	sstate-control
221M	stamps
4.0K	sysroots
12G	sysroots-components
115M	sysroots-uninative
193G	work
2.6G	work-shared

so work, sysroot-components and deploy are the biggest users.=20

In deploy:

6.7G	deb
3.0G	images
9.5G	ipk
50M	licenses
7.3G	rpm
1.1G	spdx

Taking a look to see which packages are the worst offenders:

tmp/deploy/deb/core2-64> du -a . | sort -n -r | head -n 20
6386408	.
1360916	./llvm-staticdev_18.1.8-r0_amd64.deb
987368	./llvm-dbg_18.1.8-r0_amd64.deb
366640	./openssl-dbg_3.3.1-r0_amd64.deb
363696	./qemu-dbg_9.0.1-r0_amd64.deb
270972	./gcc-dbg_14.1.0-r0_amd64.deb
257156	./cmake-dbg_3.29.3-r0_amd64.deb
114396	./webkitgtk-dbg_2.44.1-r0_amd64.deb
75020	./spirv-tools-dbg_1.3.283.0-r0_amd64.deb
70340	./ltp-dbg_20240524-r0_amd64.deb
69440	./openssl-ptest_3.3.1-r0_amd64.deb
68972	./vulkan-validation-layers-dbg_1.3.283.0-r0_amd64.deb
67424	./rust_1.75.0-r0_amd64.deb
62492	./kea-dbg_2.4.1-r0_amd64.deb
59960	./boost-staticdev_1.85.0-r0_amd64.deb
54936	./mesa-dbg_24.0.7-r0_amd64.deb
44532	./ghostscript-dbg_10.03.1-r0_amd64.deb
41968	./gdb-dbg_14.2-r0_amd64.deb
38404	./llvm_18.1.8-r0_amd64.deb
34812	./vulkan-samples-staticdev_git-r0_amd64.deb

for work:

tmp/work> du -sh *
8.1G	all-poky-linux
181G	core2-64-poky-linux-musl
13G	qemux86_64-poky-linux-musl
7.3M	sdk-provides-dummy-target-poky-linux
31G	x86_64-linux

tmp/work/core2-64-poky-linux-musl> du -s * | sort -n -r=20

39885412	llvm
11845216	rust
10613980	qemu
7455364	openssl
7252496	piglit
6597112	cmake
6230344	gcc
5819084	cargo
5204012	webkitgtk
4593744	ltp
4461764	vulkan-samples
4289708	rust-llvm
3727792	boost
3057464	libstd-rs
2013500	kea
2001756	mesa
1959788	vulkan-validation-layers
1883944	spirv-tools
1863744	ghostscript
1657352	linux-libc-headers
1545456	ovmf
1479244	binutils
1458936	valgrind
1454960	librsvg
1421760	gcc-runtime
1336516	gdb
1299392	go-runtime
1284564	perl
1221508	go
901188	python3-maturin
853796	gtk4
795300	icu
786088	python3
704640	harfbuzz
658440	git
631396	python3-numpy
626708	ruby
605536	gtk+3
603252	acl
571464	glslang
552480	db
552300	meta-extsdk-toolchain
507088	binutils-testsuite
491864	coreutils
443960	glib-2.0
443880	strace
437192	gnutls
421236	gettext
419428	elfutils
407420	apt
398348	gstreamer1.0-plugins-bad
394676	python3-cryptography-vectors
386172	epiphany
382136	libdnf
363232	fmt
350408	lttng-tools
348612	p11-kit
341968	util-linux
336064	grub
332496	vim
322056	go-helloworld
320484	u-boot-tools
306976	python3-cython
294528	alsa-plugins
293248	re2c
289252	gstreamer1.0-plugins-good
284836	python3-cryptography
279960	grub-efi
270544	gstreamer1.0-plugins-base
270236	libxml2
262532	libgcrypt
260976	subversion
257380	ccache
257200	bluez5
253872	appstream
243780	libsdl2
231548	glib-2.0-initial
228960	gnupg
227620	vala
222804	xserver-xorg
207516	alsa-tools
206272	zstd
200856	python3-bcrypt
198948	groff
198712	gstreamer1.0
196728	texinfo
195428	dpkg
184428	nettle
182092	bind
181880	curl
181260	python3-lxml
181196	python3-babel
171184	cairo
169532	e2fsprogs
169176	python3-rpds-py
168004	btrfs-tools
167540	babeltrace2
167056	virglrenderer
165724	tcl
160332	pulseaudio
157060	cups
156620	openssh
155668	connman-gnome
155256	puzzles
155068	libgit2
151872	libx11
151524	systemd-boot
150752	weston
148600	acpica
147592	taglib
147032	gdk-pixbuf
142544	log4cplus
142432	vte
141108	python3-scons
139480	swig
136444	vim-tiny
133708	xwayland
131736	bash
126576	mc
125620	busybox
124612	libadwaita
120312	xf86-video-intel
116068	wpa-supplicant
115500	sudo
115380	ncurses
115312	stress-ng
113560	m4
110220	libseccomp
109032	util-linux-libuuid
107312	bison
104824	libunistring
103196	python3-rdflib
103032	musl
102888	flex
102812	vulkan-utility-libraries
102116	gawk
100232	aspell
97972	python3-pygments
96832	dbus
95900	gcr
95540	ofono
95428	vulkan-headers
93908	python3-sphinx
93368	man-pages
91560	gconf
91040	libgcc
90112	slang
88336	python3-pip
87932	python3-pyelftools
87516	libxcb
86320	shadow
86028	findutils
85704	wget
85644	tar
84880	pango
83228	nasm
81944	gpgme
81700	mesa-demos
80792	vulkan-tools
80680	libdazzle
79788	eudev
79132	man-db
78672	meson
77828	inetutils
77436	shared-mime-info
77360	parted
76072	lttng-ust
75732	libarchive
75516	sqlite3
75324	pixman
75112	libinput
75004	connman
74604	libfm
73548	at-spi2-core
72668	gmp
72048	syslinux
71180	iproute2
70124	python3-pycryptodomex
70016	python3-pycryptodome
69832	powertop
69756	libxkbcommon
69532	libical
69480	dnf
68804	flac
68064	kbd
67808	libhandy
67692	rpm
67288	libpsl
66248	libsoup-2.4
66164	avahi
65232	alsa-lib
64996	libsoup
63072	libjpeg-turbo
62120	gobject-introspection
61964	diffutils
61248	mtd-utils
61064	tiff
60900	libwebp
60644	freetype
60616	mpfr
60392	sysstat
60092	libnl
60004	ninja
59636	gsettings-desktop-schemas
58564	grep
58504	gstreamer1.0-vaapi
58296	libssh2
57876	shaderc
57756	libpcre
57508	libpcre2
57452	xz
56872	glew
56404	sed
55692	babeltrace
55276	libva-utils
54648	python3-setuptools
54184	cpio
53152	libxslt
52816	libevent
52596	file
52448	xkeyboard-config
52348	lighttpd
51812	libc-test
51656	iptables
50812	libepoxy
49872	alsa-utils
49824	bzip2
49684	python3-beartype
49036	libglu
49036	gst-devtools
48880	procps
48456	libmodulemd
48432	libidn2
48352	less
47240	libsecret
47004	rxvt-unicode
46852	libsamplerate0
46824	libmicrohttpd
46008	serf
45828	mpg123
45500	libexif
45352	dropbear
44752	liburcu
44332	python3-sphinx-rtd-theme
44216	nfs-utils
43952	libsndfile1
43512	apr
43480	gstreamer1.0-rtsp-server
43072	json-glib
42528	xmlto
42368	glib-networking
42292	gi-docgen
42140	vulkan-loader
41644	libsolv
41612	libxt
41392	pcmanfm
40884	python3-docutils
40660	enchant2
40628	ell
40576	mdadm
40432	ethtool
40036	make
39808	fribidi
39304	socat
39296	fontconfig
39240	ppp
38144	python3-spdx-tools
38124	libtool
37948	python3-pytest
37928	bootchart2
37668	wayland
37472	readline
37436	createrepo-c
37056	cracklib
36948	gptfdisk
36608	libxmlb
36484	libgpg-error
36428	orc
36248	libdrm
35892	python3-pygobject
35840	pkgconfig
35704	python3-chardet
35444	quota
35348	libpcap
34796	lz4
34588	libtasn1
34532	patch
34424	gdbm
34396	libvorbis
34188	libcomps
34016	matchbox-panel-2
33996	python3-pytz
33884	patchelf
33800	automake
33740	graphene
33716	tcf-agent
33324	gzip
33284	nghttp2
33192	lua
33112	lame
33044	python3-pyyaml
33028	expat
32820	python3-hypothesis
32820	libportal
32428	expect
32392	libpng
32372	autoconf
32228	gst-examples
32028	neard
31976	rsync
31800	lsof
31768	libtheora
31732	libunwind
31716	python3-poetry-core
31596	gnu-efi
31504	asciidoc
31464	libcgroup
31188	distcc
30648	kmscube
30444	dbus-glib
30404	l3afpad
30104	libxi
29944	wpebackend-fdo
29720	kmod
29520	libva
29256	consolekit
29224	apr-util
29108	python3-cffi
29000	opkg
28908	libcap-ng-python
28820	bash-completion
28576	python3-psutil
28556	libpipeline
28208	python3-dbus
27632	libfm-extra
27344	xorgproto
27336	libuv
27336	libksba
27312	waffle
27272	erofs-utils
27248	screen
27244	libxfont
26900	libcheck
26676	libbsd
26636	unzip
26488	lzo
26204	matchbox-keyboard
25836	python3-license-expression
25716	speex
25564	python3-pycairo
25552	psmisc
25468	diffstat
25256	dejagnu
25156	libxfont2
25140	python3-testtools
25040	python3-markdown
25004	libtraceevent
24972	blktrace
24968	xf86-input-evdev
24900	python3-dtc
24844	python3-git
24832	librepo
24776	gstreamer1.0-python
24772	dtc
24720	xinetd
24672	python3-setuptools-rust
24664	gtk-doc
24632	python3-mako
24552	dhcpcd
24376	wic-tools
24364	popt
24304	json-c
24108	libtirpc
23956	xf86-input-synaptics
23952	libslirp
23932	python3-jsonschema
23860	python3-websockets
23800	libxmu
23796	libxft
23760	libffi
23728	python3-dtschema
23716	python3-snowballstemmer
23672	libproxy
23660	libxpm
23588	efivar
23520	python3-pyasn1
23492	zip
23464	xf86-video-vmware
23456	libnotify
23412	numactl
23392	libmpc
23368	xinput-calibrator
23360	libxext
23352	python3-click
23300	matchbox-terminal
23092	python3-pbr
22944	attr
22856	libusb1
22820	msmtp
22816	python3-py
22716	python3-yamllint
22632	pciutils
22584	libedit
22556	xf86-input-libinput
22400	matchbox-wm
22388	minicom
22352	python3-ruamel-yaml
22288	python3-dbusmock
22192	libmodule-build-perl
22164	matchbox-desktop
22112	libgudev
22088	libassuan
22040	ttyrun
22004	seatd
21988	xf86-video-cirrus
21932	net-tools
21916	speexdsp
21820	menu-cache
21812	sato-screenshot
21716	libva-initial
21692	python3-subunit
21652	xxhash
21552	mtools
21472	python3-asn1crypto
21468	python3-pycparser
21400	python3-setuptools-scm
21392	squashfs-tools
21272	kexec-tools
21268	python3-sphinxcontrib-serializinghtml
21256	python3-jinja2
21180	libevdev
21144	settings-daemon
21136	xf86-input-mouse
21120	python3-hatchling
21112	python3-wcwidth
21036	libxkbfile
20964	python3-attrs
20924	libmatchbox
20840	python3-pyparsing
20724	python3-requests
20668	xf86-input-vmmouse
20588	spirv-headers
20568	gperf
20488	libatomic-ops
20484	desktop-file-utils
20468	python3-urllib3
20436	python3-ndg-httpsclient
20380	python3-pyrsistent
20256	logrotate
20216	python3-sphinxcontrib-htmlhelp
20180	zlib
20176	libice
20152	python3-flit-core
20056	xf86-video-vesa
20052	libyaml
20036	pinentry
20024	iputils
19996	libxcursor
19988	python3-pathspec
19924	sbc
19852	python3-sphinxcontrib-applehelp
19840	python3-webcolors
19816	libogg
19704	libxrandr
19700	python3-ply
19692	xf86-video-fbdev
19648	python3-installer
19612	python3-sphinxcontrib-qthelp
19600	python3-zipp
19520	libxrender
19488	python3-sphinxcontrib-devhelp
19400	xkbcomp
19396	python3-meson-python
19204	python3-sortedcontainers
19196	quilt
19184	python3-gitdb
19152	python3-pyopenssl
19112	bmaptool
19044	python3-pluggy
18860	python3-iso8601
18800	python3-certifi
18768	python3-packaging
18752	python3-imagesize
18728	xcb-util-wm
18700	python3-importlib-metadata
18692	time
18640	libxml-parser-perl
18620	gnome-desktop-testing
18608	matchbox-config-gtk
18588	usbutils
18532	sysklogd
18532	sysfsutils
18368	libcap-ng
18352	wayland-utils
18352	rpcbind
18324	python3-isodate
18320	python3-libarchive-c
18312	python3-markupsafe
18256	libsm
18244	python3-referencing
18168	dosfstools
18136	libxvmc
18036	libxfixes
18004	bc
17964	python3-pysocks
17952	python3-booleanpy
17940	python3-trove-classifiers
17892	python3-xmltodict
17892	libxv
17888	libxdmcp
17844	libxtst
17816	python3-calver
17808	lrzsz
17764	xcb-util-image
17744	python3-wheel
17732	python3-iniparse
17728	python3-pytest-subtests
17716	python3-toml
17716	python3-semantic-version
17716	python3-idna
17708	python3-more-itertools
17692	x11perf
17680	libmd
17628	python3-pytest-runner
17624	libxxf86vm
17552	python3-typogrify
17548	python3-pathlib2
17524	python3-smmap
17492	libnsl2
17476	python3-smartypants
17404	xcb-util-errors
17392	xcb-util-cursor
17348	libxscrnsaver
17340	python3-jsonpointer
17324	python3-atomicwrites
17324	libdaemon
17268	rng-tools
17268	python3-uritools
17264	iw
17256	lzop
17248	python3-iniconfig
17224	libfontenc
17216	python3-rfc3987
17216	python3-magic
17212	sysvinit
17208	libxcomposite
17172	python3-sphinxcontrib-jsmath
17144	python3-extras
17116	python3-six
17112	startup-notification
17104	xcb-util
17076	python3-rfc3986-validator
17056	python3-vcversioner
17024	xcb-util-renderutil
17008	libxres
16960	python3-rfc3339-validator
16936	libxau
16924	libxinerama
16904	cronie
16896	xcb-util-keysyms
16892	python3-pretend
16748	argp-standalone
16668	python3-jsonschema-specifications
16616	libxshmfence
16564	libxdamage
16556	rpcsvc-proto
16512	npth
16480	libpciaccess
16428	python3-sphinxcontrib-jquery
16356	libcap
16352	liburi-perl
16316	libucontext
16312	unfs3
16296	python3-hatch-fancy-pypi-readme
16268	debugedit
16244	lzip
16188	libmnl
16108	musl-locales
16084	libfakekey
16048	python3-build
15980	python3-typing-extensions
15980	mobile-broadband-provider-info
15928	matchbox-theme-sato
15912	python3-hatch-vcs
15892	libwpe
15752	xwininfo
15736	mtdev
15724	tcp-wrappers
15712	xcb-proto
15700	watchdog
15560	font-util
15524	libxcvt
15508	xauth
15480	xinput
15460	acpid
15444	blktool
15396	python3-pyproject-hooks
15312	python3-unittest-automake-output
15296	fts
15280	dbus-wait
15244	python3-pyproject-metadata
15216	musl-obstack
15152	python3-alabaster
15136	xrandr
15104	xprop
15072	python3-editables
15072	at
15052	python3-tomli
15012	psplash
14888	xeyes
14768	xset
14760	mkfontscale
14640	xinit
14636	xhost
14524	xdpyinfo
14480	xmodmap
14424	libacpi
14396	pm-utils
14360	vulkan-volk
14360	makedepend
14316	libxml-sax-perl
14292	xdg-utils
14108	xev
14104	dos2unix
14084	debianutils
14008	ifupdown
14004	xtrans
14004	libxml-simple-perl
13904	libxml-perl
13900	rgb
13696	xvinfo
13588	libconvert-asn1-perl
13584	libtimedate-perl
13400	libxml-sax-base-perl
13356	base-passwd
13320	which
13124	libtest-warnings-perl
12980	intltool
12972	i2c-tools
12896	chrpath
12892	dmidecode
12880	help2man
12860	xrestop
12820	hdparm
12688	libtry-tiny-perl
12512	pigz
12424	musl-utils
12312	itstool
12304	libtest-fatal-perl
12252	libtest-needs-perl
12208	gcompat
12164	libxml-namespacesupport-perl
12128	cryptodev-tests
12096	setserial
11920	efibootmgr
11804	libubootenv
11768	ed
11532	util-macros
11528	libptytty
11452	unifdef
11392	pbzip2
11388	mmc-utils
11176	libpthread-stubs
11016	libjitterentropy
10960	dwarfsrcfiles
10896	meta-ide-support
10816	libaio
10700	repo
10652	libtool-cross
10636	ptest-runner
10580	cwautomacros
10468	resolvconf
10384	lzlib
10196	utfcpp
10132	hwlatdetect
10036	opkg-utils
9656	init-system-helpers
9624	cryptodev-linux
9604	builder
9592	pong-clock
9512	mingetty
9480	lsb-release
9480	initscripts
9384	packagegroup-self-hosted
9216	makedevs
9176	udev-extraconf
9176	alsa-state
9044	python3-dtschema-wrapper
8960	initramfs-module-install-efi
8936	mini-x-session
8924	modutils-initscripts
8924	matchbox-session
8920	initramfs-module-install
8904	watchdog-config
8836	tiny-init
8832	nfs-export-root
8828	distcc-config
8812	opkg-keyrings
8760	gnu-config
8516	libssp-nonshared
8312	ssh-pregen-hostkeys
8116	initramfs-live-install-efi-testfs
8100	bsd-headers
8064	initramfs-live-install-efi
8060	initramfs-live-install-testfs
8044	initramfs-live-install
7936	icecc-create-env
7784	musl-legacy-error
7776	packagegroup-core-standalone-sdk-target
7704	packagegroup-core-buildessential
7688	qemuwrapper-cross
7652	packagegroup-core-tools-debug
2144	libgcc-initial
1380	shadow-sysroot


du -sh llvm rust qemu
39G	llvm
14G	rust
11G	qemu

and breaking down llvm:

core2-64-poky-linux-musl/llvm> du -sh 18.1.8/*
13G	18.1.8/build
304K	18.1.8/debugsources.list
2.3G	18.1.8/deploy-debs
3.1G	18.1.8/deploy-ipks
2.5G	18.1.8/deploy-rpms
4.0K	18.1.8/deploy-source-date-epoch
7.6G	18.1.8/image
48K	18.1.8/license-destdir
1.9G	18.1.8/llvm-project-18.1.8.src
584K	18.1.8/llvm.spec
7.6G	18.1.8/package
1.8M	18.1.8/packages-split
812K	18.1.8/pkgdata
812K	18.1.8/pkgdata-pdata-input
5.1M	18.1.8/pkgdata-sysroot
8.4M	18.1.8/pseudo
237M	18.1.8/recipe-sysroot
861M	18.1.8/recipe-sysroot-native
8.0K	18.1.8/source-date-epoch
60K	18.1.8/sources-unpack
15M	18.1.8/spdx
4.0K	18.1.8/sstate-install-deploy_source_date_epoch
4.0K	18.1.8/sstate-install-populate_lic
4.0K	18.1.8/sstate-install-recipe_qa
85M	18.1.8/sysroot-destdir
20M	18.1.8/temp
12K	18.1.8/toolchain.cmake

with a clean of openssl, llvm and qemu:

4.0K	tmp/abi_version
79M	tmp/buildstats
73M	tmp/cache
17G	tmp/deploy
136K	tmp/hosttools
327M	tmp/log
152M	tmp/pkgdata
4.0K	tmp/qa.log
4.0K	tmp/saved_tmpdir
218M	tmp/sstate-control
220M	tmp/stamps
4.0K	tmp/sysroots
7.9G	tmp/sysroots-components
115M	tmp/sysroots-uninative
153G	tmp/work
2.6G	tmp/work-shared

and a rebuild with the master-next patches to tweak debugging data:

4.0K	tmp/abi_version
81M	tmp/buildstats
73M	tmp/cache
19G	tmp/deploy
136K	tmp/hosttools
347M	tmp/log
154M	tmp/pkgdata
4.0K	tmp/qa.log
4.0K	tmp/saved_tmpdir
222M	tmp/sstate-control
226M	tmp/stamps
4.0K	tmp/sysroots
8.5G	tmp/sysroots-components
115M	tmp/sysroots-uninative
168G	tmp/work
2.6G	tmp/work-shared

which is at least a start. I know a lot of people just enable rm_work
but I think there are deeper issues in here we should look into and
optimise.

Cheers,

Richard



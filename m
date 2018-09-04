Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 183DA78D24
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 13:29:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w84DT23h029128
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 06:29:03 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 06:29:02 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj-4XNrwM4xEnnPrdgdobecJa3e+5RQYzoRWYYum=WRyoQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <3b83ec3a-af68-928e-6fae-ef71fbca77f6@windriver.com>
Date: Tue, 4 Sep 2018 21:29:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj-4XNrwM4xEnnPrdgdobecJa3e+5RQYzoRWYYum=WRyoQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 04 Sep 2018 13:29:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月03日 17:54, Alexander Kanavin wrote:
> 2018-09-03 11:35 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
>> They can't be built without opengl in DISTRO_FEATURES.
>> [snip]
>> |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
>> fatal error: GL/gl.h: No such file or directory
>> [snip]
> Apologies, but NAK.
>
> Webkit recipe already has the necessary configuration to handle this:
>
> PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11', 'wayland' ,d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'webgl opengl', '' ,d)} \
>
> PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
> PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
>
>
> If disabling opengl does not work, then you should look closer into
> why, instead of just requiring opengl to be present always.
I am afraid whether opengl or not, it always requires virtual/libql
just like Ubuntu/Fedora does.

[Fedora webkitgtk.spec]
BuildRequires:  mesa-libGL-devel
[Fedora webkitgtk.spec]

[Ubuntu debian/control]
Build-Depends: libgl1-mesa-dev [!armel !armhf !arm64]
[Ubuntu debian/control]

I tried to move `virtual/libgl' from PACKAGECONFIG to DEPENDS,
but unfortunately, the provider of `virtual/libgl' -- mesa/mesa-ql,
they require `opengl 'or `vulkan' in distro features check.

//Hongxu

> Alex




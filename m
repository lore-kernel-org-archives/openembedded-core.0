Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UAGbk-0000LU-EC
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:14:08 +0100
Received: by mail-oa0-f42.google.com with SMTP id i18so4686460oag.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 00:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=I0VjhfV81KjnA76Bn/zfQZxp4S46lmLDBwpt4iwS7gY=;
	b=wlm/tawehcBmXJrH7tI0ODXYBP92Y4yx7VGPihbdQd4Ll+V85wc8A2/IWpAiRVKg+0
	Tg7a4qh285m21SbPkL98g6nrxMw2fZRzwrmyzM7PXJ1tBsyHUnrzLFkWZMRz54AI52+O
	p+iWddl3zmICSZ61kDL77+mnFoktnUFxpmPmt0ZRgGvWc+9soqDPhapKOVX5GqbHN7ph
	N4/IaiiAcDgNOEw1gfS8l/0Tdty4de+dgGbWdKtaLSoeSE/5n3F6DvVHA0nxKui58Av0
	tsf/zepS4ofmZ2qmiMmdjo81Rc6e8647gaXTqg4I42a/L+qE6iQDw3uyNETTShMJTk6d
	LKhw==
MIME-Version: 1.0
X-Received: by 10.60.169.212 with SMTP id ag20mr610789oec.102.1361869057075;
	Tue, 26 Feb 2013 00:57:37 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Tue, 26 Feb 2013 00:57:36 -0800 (PST)
Date: Tue, 26 Feb 2013 09:57:36 +0100
Message-ID: <CAGiJk9drhuVo1AfCsHEc3jbevtzaYcONQwHQ2qfE=HuJjUCbSw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gst-plugins-bad and EXTRA_OECONF
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 09:14:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

recently my builds fail with obscure errors like:
gst-plugins-bad:
| /usr/lib/x86_64-linux-gnu/libxml2.so: file not recognized: File
format not recognized
| collect2: error: ld returned 1 exit status


This is caused by sdl-config from my buildhost, though gst-plugins-bad
has EXTRA_OECONF += "... --disable-sdl ... --disable-orc"

It seems to be ignored:
checking for ORC... yes
checking for usable orcc...
/work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/orcc
...
configure: *** checking feature: SDL plug-in ***
configure: *** for plug-ins: sdlvideosink sdlaudiosink ***
checking for sdl-config... /usr/bin/sdl-config
checking for SDL - version >= 0.11.0... cross compiling; assumed OK...
yes
configure: *** These plugins will be built: sdlvideosink sdlaudiosink



Maybe anyone can reproduce this error with:
bitbake -ccleansstate libsdl gst-plugins-bad && bitbake gst-plugins-bad
(eventually manual deletion of sdl-config in
<sysroot-target>/usr/bin/crosscripts is necessary)

Is this a known bug?


--
Regards
Samuel



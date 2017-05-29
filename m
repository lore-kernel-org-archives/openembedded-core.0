Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2F74A77CF8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 21:14:07 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id a72so55582112qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=FT6ZsKvOGWk8d81/FbITAJJho9vSLIrpzsaQ+MjZMCs=;
	b=Qx5nl/pwTYEc0Ldg7RmDJp1Lpnf1AeOTDqP3QzGn4xLqVm5Vcbum637xP0t5bhLkN5
	eVegzrb2UCSyA1DAQuAPI+ZK7LklHiISZc3rpx12m5y1cTMgiqndZ8sVtHAPCVe1zqAh
	45ob0McsG+iCji+yUPygRkzcjD/hUqud2eapY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FT6ZsKvOGWk8d81/FbITAJJho9vSLIrpzsaQ+MjZMCs=;
	b=j3TgUpVIbkITzFxfOphlT84e/+sYMg5a3mqMz8YJUcSJMgT+aoaC4LILFHRnhbpXeT
	4ABslSHQZvT4iAkZiP8yvyxRHOPKN8z5IGMG6jV7kEoqqbOaqJHnCnOA9V8lC8+PzcJi
	qJVeSsI5cubAyqgnSmaTnO47ND48VeSTD++IZJBHfsL7NfKGwLkyHTfJAMexHi0L2FaJ
	/fpOteNdW8tJHkGeckgSQqObH7owLuJFjawV8o6oVydEVebvlNZV1cz7Z1OWNh4gQQc5
	750krhXwg9bMrpmYLV/aSH1sBJYaOIJnHouasGTFxR13zTehufpOM3Tnv13Ov9wVWX9V
	Z0Hw==
X-Gm-Message-State: AODbwcDXqvO8vO3uZ5VhgRgqIbW/c+81hyHLA1PzRd0vrKWhKiF301bS
	xYfGSbW3qmbUEk6o8cH8EjX2IVp4DuRuEf6GAA==
X-Received: by 10.233.216.194 with SMTP id u185mr18003441qkf.105.1496092448965;
	Mon, 29 May 2017 14:14:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Mon, 29 May 2017 14:13:48 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 29 May 2017 23:13:48 +0200
Message-ID: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Mon, 29 May 2017 21:14:08 -0000
Content-Type: text/plain; charset="UTF-8"

hi,

i am trying to set  KERNEL_IMAGETYPES="Image.gz" in my machine conf
file. But it doesn't work. I am seeing this error during
kernel_do_compile():

run.do_compile.30019: cannot open Image: No such file

In fact the code snippet that tries to compress the Image file into
Image.gz expects the Image file to be in ${B}, but when compiling
kernel Image is actually in ${B}/arch/arm64/boot:

$ find tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/
-name Image
tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/4.9-r0/build/arch/arm64/boot/Image

The piece of code in question is in kernel.bbclass:

  gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
It really sounds to me like something obvious is missing, i doubt I
would be the first one to try Image.gz..

Any thoughts?

thanks
nico


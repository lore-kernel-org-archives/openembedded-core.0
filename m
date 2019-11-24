Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 19DD67F827
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:58:49 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id n1so14460590wra.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=CfXMDh9UnxlGfBIu6bMYSGOo3MsmthdIaP0105xrYSo=;
	b=GqWim28iOYaDxGRrt3XwSAPq4cqIuTWpK5XS5XyOO0y+W9H3fpdw6C9ZiJKYMP6IJl
	1mI2kBTdItPlDzGCSrkquugkN8fteKl14cn3rvuYjSV5u/S1fBba8vuF85ob74ICMpUk
	pwJ9kOxmfHGylbgxbL6gDRpp5bJS4T5TiRWes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=CfXMDh9UnxlGfBIu6bMYSGOo3MsmthdIaP0105xrYSo=;
	b=HtlaEiZ6UFsdplEu23qI3txWSXQepci7iM0C6Lk87rCXlvh2a/r8j7efCbF5xVoF9S
	msAenujaXmKZNmlwET0UzF8UuN1Z9eBnijcdhYTv2P4nZDFL3Xpmdv8AD3DF2UZfCt0i
	3WHCSfRZEF/+6M8zK8KHD1jAOs10AUPfxUJHQcMd2UFK5LLvlLj91Hpejw/BB/W6SIqU
	TlKTsyUEX5HmoWMJDrLLj0p1ANwj5tyctThJQRmor/+r8tjVIANsyEaAAkl28tnF8Crw
	N6BWJPWAy+UnYO6DCvlDwAasP8zpuQA4/RDFRom52/0f0aGenEVjpLmeva87zfFGjU17
	di8w==
X-Gm-Message-State: APjAAAUyYia+9ZWBdLZJcZSZHizA9Glu1xkzmmckuAx5l0ZYVWr8SnTJ
	X+vpT63JFiYDtKUDnwu1wgwpgw==
X-Google-Smtp-Source: APXvYqy3XVmsjOxinTpPmWlWdKOLzmf38psxB3XlOYfhGUQ2pf1tkYsZz7l09E8pASNkt0yQsFXw/w==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr18730627wro.375.1574611130494;
	Sun, 24 Nov 2019 07:58:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m15sm6574781wrq.97.2019.11.24.07.58.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2019 07:58:49 -0800 (PST)
Message-ID: <559334b39f154c70d868dce6067984298976d841.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 24 Nov 2019 15:58:48 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Hash Equiv rehash problems
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
X-List-Received-Date: Sun, 24 Nov 2019 15:58:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a small problem with hash equiv. I've spent quite a lot of time
staring at broken builds trying to figure out what is happening and its
not even easy to explain. The easiest example I have is perhaps this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/1260

where the eSDK is failing as meta-extsdk-toolchain can't be installed
into the eDSK.

Its easy enough to reproduce from the build artefacts:

pokybuild@debian8-ty-1:/tmp$ ~/yocto-worker/qemux86/build/build/tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-32-qemux86-toolchain-ext-3.0.sh 
 Poky (Yocto Project Reference Distro) Extensible SDK installer version 3.0
 ==========================================================================
 Enter target directory for SDK (default: ~/poky_sdk): /tmp/rptest
 [...]
pokybuild@debian8-ty-1:/tmp$ . /tmp/rptest/environment-setup-core2-32-poky-linux
 SDK environment now set up; additionally you may now run devtool to perform development tasks.
 Run devtool --help for further details.
pokybuild@debian8-ty-1:/tmp$ devtool sdk-install meta-extsdk-toolchain
 NOTE: Starting bitbake server...
 Loading cache: 100% |###############################################################################################################################| Time: 0:00:00
 Loaded 1302 entries from dependency cache.
 INFO: Installing meta-extsdk-toolchain...
 Loading cache: 100% |###############################################################################################################################| Time: 0:00:00
 Loaded 1302 entries from dependency cache.
 NOTE: Resolving any missing task queue dependencies
 Initialising tasks: 100% |##########################################################################################################################| Time: 0:00:00
 Checking sstate mirror object availability: 100% |##################################################################################################| Time: 0:00:00
 Sstate summary: Wanted 53 Found 50 Missed 3 Current 133 (94% match, 98% complete)
 NOTE: Executing Tasks
 NOTE: Setscene tasks completed
 NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
ERROR: Failed to install meta-extsdk-toolchain - unavailable

[adding -s allows it to work, it doesn't build much]

The interesting bit is to look back at the original build logs:

[meta-extsdk-toolchain comes from the sstate cache]
NOTE: Task /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb:do_populate_sysroot unihash changed to 577ad44bb0150016da775bda4d1eadbad665a3714e9ad9c4a2b3d28d0f20a28b
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_qa so ignoring rehash
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_packagedata so ignoring rehash
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package so ignoring rehash
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_write_ipk so ignoring rehash
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_write_deb so ignoring rehash
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_write_rpm so ignoring rehash
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_populate_sysroot so ignoring rehash
NOTE: Running task 8970 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_locked_sigs)
NOTE: Running task 8971 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/images/core-image-minimal.bb:do_sdk_depends)
NOTE: Running task 8972 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-sato/images/core-image-sato.bb:do_sdk_depends)
NOTE: recipe meta-extsdk-toolchain-1.0-r0: task do_locked_sigs: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_sdk_depends: Started
NOTE: recipe meta-extsdk-toolchain-1.0-r0: task do_locked_sigs: Succeeded
NOTE: recipe core-image-sato-1.0-r0: task do_sdk_depends: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_sdk_depends: Succeeded
NOTE: recipe core-image-sato-1.0-r0: task do_sdk_depends: Succeeded
NOTE: recipe buildtools-tarball-1.0-r0: task do_populate_sdk: Succeeded
NOTE: Running task 8973 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/images/core-image-minimal.bb:do_populate_sdk_ext)
NOTE: Running task 8974 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk_ext)
NOTE: recipe core-image-minimal-1.0-r0: task do_populate_sdk_ext: Started
NOTE: recipe core-image-sato-1.0-r0: task do_populate_sdk_ext: Started
NOTE: recipe core-image-sato-1.0-r0: task do_populate_sdk: Succeeded
NOTE: recipe core-image-sato-1.0-r0: task do_populate_sdk_ext: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_populate_sdk_ext: Succeeded
NOTE: Tasks Summary: Attempted 8974 tasks of which 8939 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

What this means is that gdb-cross changes the sstate hash of meta-
extsdk-toolchain:do_* as it found an equiv match but those artefacts
were never generated. That hash was written into the eSDK sigs but it
isn't present in sstate.

I did put a comment in runqueue.py a while back:

# Potentially risky, should we report this hash as a match?
logger.info("Already covered setscene for %s so ignoring rehash" % (tid))

and it does re-raise this question.

There may be two possible fixes:

a) We force setscene tasks which have already run to rerun if this kind
of rehash happens. We did previously do this but runqueue *really*
doesn't like rerunning setscene tasks.
b) We report these 'additional' equivalences to the server

We are seeing other symptoms of this "rehashing" in builds where
"bitbake X; bitbake X" will suddenly rebuild a load of stuff in the
second build as it didn't build it originally due to the "ignoring
rehash" messages. This is very counter-intuitive and effectively a
different representation of the same bug. Its less problematic since we
just rebuild things (eSDK can't).

If we decide b) is correct, it also raises an interesting scope
question. Should we:

a) only report things we've run into in real builds
b) report all hashes (there'd be loads)
c) report all hashes which are present in sstate

?

I think I need to sit and think about this for a while. Ccing Joshua in
case he has any insights into this...

We can't enable hashequiv by default until we get this fixed somehow.

Cheers,

Richard







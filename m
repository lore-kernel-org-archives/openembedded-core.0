Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id E28027F775
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 20:51:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t1so15097822wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 12:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=my2eZE6f/wLeQ7FR8kAxQdR6klHdu3Jil98hONA6PM4=;
	b=KVLgBwPHCobT0nXzYuETLRvv4/6aL9bUa8bx+HnCACIjzZrW4L5laKNaxjYXNYc1ji
	eAeiwsi9X3SZTHde9fbqEbm+tSerda1htmN8QWnHlZBzxJ5nYoNEwD7PQbbBgjQJk0/9
	3yYRcnsBXUy+EGbqC+uXdhdr3D81nDiJAU9Gxdw181w+v/9aFRTvsW4jc3lj/8lEYfKG
	2+KNj2tQokQI/7jAe7t9hbYziTzkKCW+GmXhwt2RKmU+YFTJYVP1cwY+f5Vt67hJlsef
	TEkIuYlPabK1N6MlSu/OD80rdj2io1UfYaPQ5rRTUEWD1zuYxp+W4M01GPr34hNocPgu
	+iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=my2eZE6f/wLeQ7FR8kAxQdR6klHdu3Jil98hONA6PM4=;
	b=UOzz3++9pAwiXZDlEBSKCoyoOc8TfhvifQEc7JZ/s4xpJs7RVADBNt5edwyZJ/9Juc
	YCcfwuLS7peCUV7HL0Nb5M4xmTM0Rzhdc9J5kd8OBaOuOH9uaLxJK3Tn60qKJ1hGHGSg
	hwaLWB3H9e4uYVz8UmP0AHVQsUEmY3Puf4bYK4JEDqsCKm4egQMGy0BGtDrYDSHz1GD5
	ookdWy9X0Fv3QDw3Te6BznIT04JXJ4Mm6meONtbaczO0Jd1wlIVdt7KKS+MIpaqxMs3z
	MHZ65i5TxV/coeCMFVCeIfszvQ+jCWvBOu2qkJM/evQSorOrA0hEWvkWGPfkDYs3mRFI
	kw5g==
X-Gm-Message-State: APjAAAX/NsxerV+BnzhUqqqC8uv0BW+KwsrzlQtS3FJLA0vhVQMzSbnn
	CX34VNxh6ARkstQ0spr+3lQ6d+QpUgvFjV8O45LMuG7UUtQ=
X-Google-Smtp-Source: APXvYqy/XiH619UvaC4iYIgug4z+yliB3tzLYT71iSvFWrmcGW6pDYbh8uHlXfw8XnZGY3A0Dq+gagCBF2+AsiojAiA=
X-Received: by 2002:adf:f308:: with SMTP id i8mr27623343wro.319.1574628717317; 
	Sun, 24 Nov 2019 12:51:57 -0800 (PST)
MIME-Version: 1.0
References: <559334b39f154c70d868dce6067984298976d841.camel@linuxfoundation.org>
In-Reply-To: <559334b39f154c70d868dce6067984298976d841.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 24 Nov 2019 14:51:45 -0600
Message-ID: <CAJdd5Gb=umP9TssH2+SnbbogDYhdTmRDsiz=thp_buVz5wJk5A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Hash Equiv rehash problems
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
X-List-Received-Date: Sun, 24 Nov 2019 20:51:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 24, 2019 at 9:58 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We have a small problem with hash equiv. I've spent quite a lot of time
> staring at broken builds trying to figure out what is happening and its
> not even easy to explain. The easiest example I have is perhaps this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/1260
>
> where the eSDK is failing as meta-extsdk-toolchain can't be installed
> into the eDSK.
>
> Its easy enough to reproduce from the build artefacts:
>
> pokybuild@debian8-ty-1:/tmp$ ~/yocto-worker/qemux86/build/build/tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-32-qemux86-toolchain-ext-3.0.sh
>  Poky (Yocto Project Reference Distro) Extensible SDK installer version 3.0
>  ==========================================================================
>  Enter target directory for SDK (default: ~/poky_sdk): /tmp/rptest
>  [...]
> pokybuild@debian8-ty-1:/tmp$ . /tmp/rptest/environment-setup-core2-32-poky-linux
>  SDK environment now set up; additionally you may now run devtool to perform development tasks.
>  Run devtool --help for further details.
> pokybuild@debian8-ty-1:/tmp$ devtool sdk-install meta-extsdk-toolchain
>  NOTE: Starting bitbake server...
>  Loading cache: 100% |###############################################################################################################################| Time: 0:00:00
>  Loaded 1302 entries from dependency cache.
>  INFO: Installing meta-extsdk-toolchain...
>  Loading cache: 100% |###############################################################################################################################| Time: 0:00:00
>  Loaded 1302 entries from dependency cache.
>  NOTE: Resolving any missing task queue dependencies
>  Initialising tasks: 100% |##########################################################################################################################| Time: 0:00:00
>  Checking sstate mirror object availability: 100% |##################################################################################################| Time: 0:00:00
>  Sstate summary: Wanted 53 Found 50 Missed 3 Current 133 (94% match, 98% complete)
>  NOTE: Executing Tasks
>  NOTE: Setscene tasks completed
>  NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
> ERROR: Failed to install meta-extsdk-toolchain - unavailable
>
> [adding -s allows it to work, it doesn't build much]
>
> The interesting bit is to look back at the original build logs:
>
> [meta-extsdk-toolchain comes from the sstate cache]
> NOTE: Task /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb:do_populate_sysroot unihash changed to 577ad44bb0150016da775bda4d1eadbad665a3714e9ad9c4a2b3d28d0f20a28b
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_qa so ignoring rehash
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_packagedata so ignoring rehash
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package so ignoring rehash
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_write_ipk so ignoring rehash
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_write_deb so ignoring rehash
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_package_write_rpm so ignoring rehash
> NOTE: Already covered setscene for /home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_populate_sysroot so ignoring rehash
> NOTE: Running task 8970 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/meta/meta-extsdk-toolchain.bb:do_locked_sigs)
> NOTE: Running task 8971 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/images/core-image-minimal.bb:do_sdk_depends)
> NOTE: Running task 8972 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-sato/images/core-image-sato.bb:do_sdk_depends)
> NOTE: recipe meta-extsdk-toolchain-1.0-r0: task do_locked_sigs: Started
> NOTE: recipe core-image-minimal-1.0-r0: task do_sdk_depends: Started
> NOTE: recipe meta-extsdk-toolchain-1.0-r0: task do_locked_sigs: Succeeded
> NOTE: recipe core-image-sato-1.0-r0: task do_sdk_depends: Started
> NOTE: recipe core-image-minimal-1.0-r0: task do_sdk_depends: Succeeded
> NOTE: recipe core-image-sato-1.0-r0: task do_sdk_depends: Succeeded
> NOTE: recipe buildtools-tarball-1.0-r0: task do_populate_sdk: Succeeded
> NOTE: Running task 8973 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-core/images/core-image-minimal.bb:do_populate_sdk_ext)
> NOTE: Running task 8974 of 8974 (/home/pokybuild/yocto-worker/qemux86/build/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk_ext)
> NOTE: recipe core-image-minimal-1.0-r0: task do_populate_sdk_ext: Started
> NOTE: recipe core-image-sato-1.0-r0: task do_populate_sdk_ext: Started
> NOTE: recipe core-image-sato-1.0-r0: task do_populate_sdk: Succeeded
> NOTE: recipe core-image-sato-1.0-r0: task do_populate_sdk_ext: Succeeded
> NOTE: recipe core-image-minimal-1.0-r0: task do_populate_sdk_ext: Succeeded
> NOTE: Tasks Summary: Attempted 8974 tasks of which 8939 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 6 seconds
>
> What this means is that gdb-cross changes the sstate hash of meta-
> extsdk-toolchain:do_* as it found an equiv match but those artefacts
> were never generated. That hash was written into the eSDK sigs but it
> isn't present in sstate.

So, to summarize and make sure I understand: The eSDK built with hash
equivalence enabled doesn't function because it is looking for sstate
object that do not exist?

I'm not very familiar with the eSDK, but it doesn't surprise me too
much; the locking mechanism used by the eSDK (at least the little I
understand), has some overlap with hash equivalence, so it seems like
they might not play nice together.

>
> I did put a comment in runqueue.py a while back:
>
> # Potentially risky, should we report this hash as a match?
> logger.info("Already covered setscene for %s so ignoring rehash" % (tid))
>
> and it does re-raise this question.
>
> There may be two possible fixes:
>
> a) We force setscene tasks which have already run to rerun if this kind
> of rehash happens. We did previously do this but runqueue *really*
> doesn't like rerunning setscene tasks.

Do we remember why this is the case? I know we've talked about it off
and on, but I don't think we've ever listed out the specific reasons
why this doesn't work.

I do know that one of the reasons was that it isn't possible to
transition a task from being covered by sstate to being uncovered,
because there might be dependent tasks that were completely skipped
when the task was restored from sstate (e.g. do_fetch, do_unpack,
do_compile, do_install might all get skipped if do_package_setscene is
run).

Are there other reasons?

> b) We report these 'additional' equivalences to the server

I'll admit, this never sat well with me. I couldn't ever prove why
this was "correct" (or, it has been shown to me and I didn't
understand :/ ). From a theoretical standpoint, it seems like
reporting these hashes as equivalent would be wrong since I'm not
necessarily sure we can say that the task would reproduce in an
equivalent manner. The implementation of this would, I think, agree
with me since the best mechanisms I can think of to implement this on
the server side aren't particularly pretty :(.

However, I do think it's possible I'm just missing something, and this
isn't as bad as I think.

>
> We are seeing other symptoms of this "rehashing" in builds where
> "bitbake X; bitbake X" will suddenly rebuild a load of stuff in the
> second build as it didn't build it originally due to the "ignoring
> rehash" messages. This is very counter-intuitive and effectively a
> different representation of the same bug. Its less problematic since we
> just rebuild things (eSDK can't).
>
> If we decide b) is correct, it also raises an interesting scope
> question. Should we:
>
> a) only report things we've run into in real builds

This would effectively mean only reporting equivalence when we would
print the log message "Already covered setscene..."?

> b) report all hashes (there'd be loads)

I'm not quite clear on how this would work, can you elaborate?

> c) report all hashes which are present in sstate

I'm also not sure how this one would work, can your provide more detail?

>
> ?
>
> I think I need to sit and think about this for a while. Ccing Joshua in
> case he has any insights into this...
>
> We can't enable hashequiv by default until we get this fixed somehow.
>
> Cheers,
>
> Richard
>
>
>
>
>


Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA0FC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 15:55:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17665.1667750102979120947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 07:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nIaCO/Yv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3959DFF803;
	Sun,  6 Nov 2022 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667750100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5qIIy2CCE9HZlSeX+WFV4lSdyBqlKz+BPDOXpumsko=;
	b=nIaCO/Yv6PgfhubZCEEOmmuvV5XHp+t4tCzLq1a7QzUuS1pHyKsEVJmSSaU9aKvxoLp8m+
	y+LAd+kIKZrxp+rfzMxvg+qcLG+dSjW+0x4voaDic4yog2ThL+CHqIv68YttMoWtpbd0Hi
	ARjP5e4kgHe5B75OmlCuB8pXD73JOn5oLZj9jfQD4kEQ839GtVQRVN3LkbI6vpDPuLakQV
	CLVBEwXuKfmd5j2ahRsuNBJqiiD+UzrqXMc6xzESEJa84X6b+HWirn9zfHDZsx+RHn4ysB
	4oPVgH87oclB83ai39ejODhBcbl226MKRJYq+CHcxzMa+ewvAmmsuEhOU9PTCw==
Date: Sun, 6 Nov 2022 16:54:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: openembedded-core@lists.openembedded.org,
	Nathan Rossi <nathan.rossi@digi.com>
Subject: Re: [OE-core] [PATCH 3/3] package: Fix handling of minidebuginfo
 with newer binutils
Message-ID: <Y2fY05Xy+3SjNN3q@mail.local>
References: <20221103075606.208982-1-nathan@nathanrossi.com>
 <20221103075606.208982-3-nathan@nathanrossi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103075606.208982-3-nathan@nathanrossi.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 15:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172804

Hello,

This series causes the following failure on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4354/steps/14/logs/stdio

2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add_bindir: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add_machine: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_alternatives: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_basic: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_binary: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_extlayer: ERROR
2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_inst_func: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_inst_glob: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_inst_todir_glob: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_invalid: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_orig: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_patch: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_postinstall: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_renamed: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_script: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_subdir: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_todir: ERROR
2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_wildcard: ERROR

On 03/11/2022 07:56:06+0000, Nathan Rossi wrote:
> From: Nathan Rossi <nathan.rossi@digi.com>
> 
> Newer versions of binutils (2.38+) have changed how the
> "--only-keep-debug" of objcopy behaves when stripping non-debug sections
> from an ELF.
> 
>   https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=68f543154e92ab0f5d6c569e0fa143f5e8bd2d80
> 
> This change causes associated sections to be correctly marked as NOBITS
> with the section contents removed from the output. The side effect is
> that this causes issues with objcopy's ability to perform symbol and
> relocation stripping (-S/--strip-all) on the debug split ELF, such that
> with some object files (e.g. kernel modules) objcopy fails to strip
> symbols/relocations with an error like the following:
> 
>   .../.debug/nls_cp950.ko[.rodata]: file truncated
> 
> Because of this it is now problematic to generate minidebuginfo for
> these types of ELF objects. However it is not typically useful to inject
> minidebuginfo into these types of ELFs, and other distributions (e.g.
> Fedora, referring to find-debuginfo.sh of debugedit) only insert
> minidebuginfo into executables and shared libraries.
> 
> This change causes the minidebuginfo injection to only apply to EXEC/DYN
> type ELFs, which limits the injection to executables and shared
> libraires.
> 
> Additionally this change fixes the parsing of the sections from the
> "readelf -W -S" output which was not accounting for the section index
> column having leading spaces for single digit index values e.g. "[ 1]".
> 
> Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
> ---
>  meta/classes-global/package.bbclass | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
> index 2d985d8aff..7a0a428b30 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -490,16 +490,31 @@ def inject_minidebuginfo(file, dvar, dv, d):
>          bb.debug(1, 'ELF file {} has no debuginfo, skipping minidebuginfo injection'.format(file))
>          return
>  
> +    # minidebuginfo does not make sense to apply to ELF objects other than
> +    # executables and shared libraries, skip applying the minidebuginfo
> +    # generation for objects like kernel modules.
> +    for line in subprocess.check_output([readelf, '-h', debugfile], universal_newlines=True).splitlines():
> +        if not line.strip().startswith("Type:"):
> +            continue
> +        elftype = line.split(":")[1].strip()
> +        if not any(elftype.startswith(i) for i in ["EXEC", "DYN"]):
> +            bb.debug(1, 'ELF file {} is not executable/shared, skipping minidebuginfo injection'.format(file))
> +            return
> +        break
> +
>      # Find non-allocated PROGBITS, NOTE, and NOBITS sections in the debuginfo.
>      # We will exclude all of these from minidebuginfo to save space.
>      remove_section_names = []
>      for line in subprocess.check_output([readelf, '-W', '-S', debugfile], universal_newlines=True).splitlines():
> -        fields = line.split()
> -        if len(fields) < 8:
> +        # strip the leading "  [ 1]" section index to allow splitting on space
> +        if ']' not in line:
> +            continue
> +        fields = line[line.index(']') + 1:].split()
> +        if len(fields) < 7:
>              continue
>          name = fields[0]
>          type = fields[1]
> -        flags = fields[7]
> +        flags = fields[6]
>          # .debug_ sections will be removed by objcopy -S so no need to explicitly remove them
>          if name.startswith('.debug_'):
>              continue
> ---
> 2.37.2

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172617): https://lists.openembedded.org/g/openembedded-core/message/172617
> Mute This Topic: https://lists.openembedded.org/mt/94752153/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


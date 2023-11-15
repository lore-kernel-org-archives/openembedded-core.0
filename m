Return-Path: <alberto@pianon.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDF4C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:13:49 +0000 (UTC)
Received: from server3.justice4all.it (server3.justice4all.it [95.217.19.36])
 by mx.groups.io with SMTP id smtpd.web10.10796.1700046824759116342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pianon.eu header.s=mail20151219 header.b=lk8HZZxe;
 spf=pass (domain: pianon.eu, ip: 95.217.19.36, mailfrom: alberto@pianon.eu)
Received: from localhost (localhost [127.0.0.1])
	by server3.justice4all.it (Postfix) with ESMTP id 8FE265C0096
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pianon.eu; h=
	message-id:subject:subject:from:from:date:date
	:content-transfer-encoding:content-type:content-type
	:mime-version; s=mail20151219; t=1700046821; x=1701861222; bh=kI
	d5dAdUhw7Glnp02WPmipDGq1K9AftdmSY0Y20V5o0=; b=lk8HZZxecgIPmtuZOg
	BWX+eB/+Tv7JQ+EYlg5mtF6RqRY7BP0XEhcHVWoBNNNKRysK1amuOzlpfCPI8rMS
	87KHijxDArwc75bRXJAH5v8i9QtozaGEO2jsLSJwbmE89mAOjcELcRwytBlNYMGq
	qI2ThwujNNp4JHKxqRSZw54I8=
X-Virus-Scanned: Debian amavisd-new at server3.justice4all.it
Received: from server3.justice4all.it ([127.0.0.1])
	by localhost (server3.justice4all.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VSLNWioyxl8k
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2023 12:13:41 +0100 (CET)
Received: from pianon.eu (localhost [127.0.0.1])
	(Authenticated sender: alberto@pianon.eu)
	by server3.justice4all.it (Postfix) with ESMTPA id D009A5C0095
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:13:41 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 15 Nov 2023 12:13:41 +0100
From: Alberto Pianon <alberto@pianon.eu>
To: openembedded-core@lists.openembedded.org
Subject: artifacts in sstate-plaindirs are deleted and not cached
Message-ID: <6744f48abd7233b3d51518d4e1fd7c41@pianon.eu>
X-Sender: alberto@pianon.eu
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 11:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190586

Hi,

I wanted to add sstate cache support to my WIP meta-bbtracer layer and I 
ran into a problem.

Following the manual 
(https://docs.yoctoproject.org/singleindex.html#shared-state), I tried 
to use sstate-plaindirs instead of separate sstate-inputdirs and 
sstate-outputdirs since I don't actually need to use different 
directories, but I noticed that artifacts placed in such dirs always get 
deleted, and the corresponding zst archive in sstate-cache is empty. If 
I use sstate-inputdirs/outputdirs, it works.

To isolate and reproduce the issue, I set up a dummy yocto layer that 
just adds a class that adds a task that writes a dummy file after 
do_unpack: https://github.com/alpianon/meta-sstate-test

The dummy bbclass is:

```
SSTATE_TEST_DIR = "${TMPDIR}/sstate-test/${PN}"
SSTATE_TEST_FILE = "${SSTATE_TEST_DIR}/sstate-test.json"

python do_sstatetest () {
     bb.warn("writing to %s" % d.getVar("SSTATE_TEST_FILE"))
     with open(d.getVar("SSTATE_TEST_FILE"), "w") as f:
         f.write("Hello World!")
}

addtask do_sstatetest after do_unpack before do_patch

SSTATETASKS += "do_sstatetest"
do_sstatetest[sstate-plaindirs] = "${SSTATE_TEST_DIR}"

python do_sstatetest_setscene () {
     sstate_setscene(d)
}

addtask do_sstatetest_setscene

do_sstatetest[dirs] = "${SSTATE_TEST_DIR}"
```

After running `bitbake -c sstatetest <whatever-recipe>`, a 
sstate-test.json is expected to be found in 
tmp/sstate-test/<whatever-recipe>, but such dir is empty instead. But if 
I remove the whole sstate configuration from the above bbclass, the file 
is there after running the task.

By adding some debug messages to sstate.bbclass, I concluded that the 
sstate "plaindir" content gets deleted by prepdir() function called 
within this code in sstate.bbclass: 
https://git.yoctoproject.org/poky/tree/meta/classes-global/sstate.bbclass#n385 
but I don't understand why.

Is that the intended behaviour? Am I missing something?

Thanks
Cheers,

Alberto


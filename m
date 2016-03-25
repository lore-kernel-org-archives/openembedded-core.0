Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id C18E06FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 20:18:55 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id y89so67911812qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=zMGeXvzdQGi98OaYNxRMJkiWQPQOch1oISoInQ8Umwg=;
	b=Ul7fEDF9hfYx/Sz9FvwXGR5YJ+XkN9MlgGeqJygqURW2rGVvvShSCKTh0DfVJHFR4U
	Ie/iOCfGdVi7ffsKR4U5H30wzXCN3GlDMOmjFhanUVfpV42XO+fR5OGg+dNOWBt1dQpd
	zyKk0mEsVq7+z9yiFOWq93p6QAL/6fxKhF++zqDru4smxwlweV23+ZkW0FAIoPK5mr6H
	u7n9fA72rk7jnluEoZsZLN6vGHKuKanWU+1AyFEQUK5fMRFSKRnM2y1TdJGMbDIogPTz
	RpVJpbRRkf7Lel3YV1VjV9fTOekmnZ5+Q+aYO9r5u3NwVVQSxXISRSR/a9UMtp9HMX4D
	XqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=zMGeXvzdQGi98OaYNxRMJkiWQPQOch1oISoInQ8Umwg=;
	b=UFOfv8QQBhtlgO9NI5Kmzl1uVW1iTWL7561aXApQLyz2wG+778HuSrVkmmGkeP23l8
	KOr7Y6goFsqhpg358uKpx9Y/0fsMUjxMpGIrBqRuiaM6zCUGJD/CHuw9VvYHlHkRXNej
	6aJWR3jUETQ/iXYozDmvMQQAMH+c0eT6ZMMHxwlTF7G44wEf3AYU4/D9m9VsU0WsleIk
	NQzUZhgP0wPze0BfuwAgFvql2WxZ4Ta+eiLfuMM6ppGgq7JL3RAF1NzScQt2qn3XQ4Yb
	7R3NkHaGoOg304gpYLMU9OxO5VqgB5aaSDvCPSymrl4SAdFsd9mEnN4YUlUil1juWAJ8
	AAPA==
X-Gm-Message-State: AD7BkJKg2R8IrYJsSLJzooriXGH3WSAdKK2jnYgziS0+4qkkHHtQEuEJGlI1DLX2ON58uQ==
X-Received: by 10.140.153.135 with SMTP id 129mr20839776qhz.38.1458937135828; 
	Fri, 25 Mar 2016 13:18:55 -0700 (PDT)
Received: from [192.168.1.139] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	a203sm5979877qha.31.2016.03.25.13.18.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2016 13:18:53 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <56F59D2B.2010108@gmail.com>
Date: Fri, 25 Mar 2016 16:18:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: How to use externalsrc with git workspace
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
X-List-Received-Date: Fri, 25 Mar 2016 20:19:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

In the past (say Dora era), I've used externalsrc like:

====================
DESCRIPTION = "MyApp"
LICENSE = "CLOSED"

inherit externalsrc

SRCREV = "${AUTOREV}"
PV = "1.4+gitr${SRCPV}"
PR = "r1"

SRC_URI = "git://${FILE_DIRNAME};protocol=file;branch=HEAD"
S = "${FILE_DIRNAME}"

...
====================

This was very nice in that it set SRCPV to to the git version of the HEAD of my
local workspace.  When building from a local git workspace, this makes sense to
me -- I want the Git version of the workspace, not a remote version.

Now with Jethro, I get errors like:

ERROR: ExpansionError during parsing myapp.bb: Failure expanding variable SRCPV,
expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
Fetcher failure: Unable to resolve 'HEAD' in upstream git repository in git
ls-remote output for /scratch/externalsrc/MyApp

Do you have any suggestions how to use externalsrc + a local git workspace and
avoid the above error.  I can set branch=master, etc and bitbake will then parse
it, but the remote master version is not really what I'm building.

Thanks,
Cliff



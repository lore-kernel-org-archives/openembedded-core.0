Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 350697D185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 13:04:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id h23so18466743ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 05:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=awertEJFngnEVmvzuFAUF9e7cgQOTPiqiSwbphloQkw=;
	b=gMMJvOJBoG7Zmk2NI9ip+hSFN5AU9KlaqeFO2JdydJCNg/EOhe9KnIHAZX9fKVtimh
	U5X9jBB/upQ2wH3IymksOOsc+EaGrro9wbpwbgz/5jRhNpjKEtZiyKnqWgfkavxWWiM5
	4ABtEmB+37M0YNjURKN9AGKEw++BQMNG/sWyd5e6Jem+AVr+P4xTXp60y8Nky5g+h7YB
	W305x4XNv4i32qSee6ap5Y6V/cUAsK5fZhw9coXvp85qv1Bj3QHwFupIsP06UVeNE6mA
	n8U0uJj6Y+nZ+O2J46EL3HVyskNf0Bj3+pchLBz+6i9udL5SYR8iULldKpD/QQwqCF8v
	AMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=awertEJFngnEVmvzuFAUF9e7cgQOTPiqiSwbphloQkw=;
	b=AQOXtEgHsiADnDo2myVbM/NCTldquyxF1vNn1yzpcDJQggO42hx2m4qkRv49/gAYAj
	GrtIUtS8JjtnzHiJzLnOnyVi5+y5UAWQqS/AKqVSRVICxNeHO3SGqXDMRFez+kJmLTVq
	643SjO6jTSc9F1ZYUc25vnaQI9FEp0khkzYY06kuqX7pm9hBa+19OTfDCMyJl2YRsc5M
	nPPtwrAIRW3nvw0uTYxmTV0/0JWeYbFV9YRFqBXKhvTJRB4Jno54kPvubvJLgzEy+7OP
	KOxF85kI0VM39phCC92oTJKgS+XCySFnI0nDnxQoCPX3lKY55txtzNWd8mSia7jRzv/s
	pKlA==
X-Gm-Message-State: APjAAAUbujXPoIPzVoTE+RI8CHDpdJrlBsCPw/WV05tRNONRGZI4yFi3
	IIyqXKVaZG+HL4OKg+qCQ6m9rf+LruIQ/Jg15dNSXPAnkn4=
X-Google-Smtp-Source: APXvYqzwObsIJxoHqLLgv1kwty5UQyncLe4u+RyDuYbxMOz2GfaYF+DSJMNBA5K12QYIHmtgVz+YTz6ClvTg5hLFo+o=
X-Received: by 2002:a05:651c:1049:: with SMTP id
	x9mr1746125ljm.233.1579093488397; 
	Wed, 15 Jan 2020 05:04:48 -0800 (PST)
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 15 Jan 2020 14:04:32 +0100
Message-ID: <CAPybu_1C1cqd6qyV_NEMewiYZ2aG-91yDUGzCVwmAKsX7NFwgw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Jan Lorenzen <jl@newtec.dk>, 
	tom.zanussi@linux.intel.com, ed.bartosh@linux.intel.com
Subject: Best practices: Multiple images on one partition.
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
X-List-Received-Date: Wed, 15 Jan 2020 13:04:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hello

I am trying to figure out the best way to achieve this. I have a
system with a host and a target. The target netboots form the host and
have a different package architecture.

Usually I was solving this with one partition per image/machine,
combined using a .wks file like:

part /export --source rootfs --rootfs-dir=target-image  --fstype=ext4
--label export --align 1024 --use-uuid --fsoptions defaults,ro
--extra-space 400M
part / --source rootfs --fstype=ext4 --label rootfs --align 1024
--use-uuid --fsoptions defaults,ro --extra-space 400M

and then calling wic file after generating both images. ("wic create....")

This works fine, but now I need to combine both partitions into one.
The reason is that the partition needs to play nice with the current
OTA upgrade system.

What would be the best way to do this?

1) Implement a new wic plugin, called something like muli-rootfs,
where I can specify multiple rootfs and in which directory to unpack
them

2) Implement a .bb file that combines the two images in one.

do_install() {
    tar -mzxf $HOST/host-image.tar.gz  -C ${D}/
    tar -mzxf $HOST/target-image.tar.gz  -C ${D}/export
}

3) Another way that I am not aware :)

Thanks!
--
Ricardo Ribalda


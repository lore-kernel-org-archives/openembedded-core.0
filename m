Return-Path: <joaohf@gmail.com>
Received: from mail-vn0-f48.google.com (mail-vn0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA9E60097
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 22:19:56 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so17751645vnb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 15:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=3SCrfyXjUkpUAhLyoXnZXwh8DE49M51JA4zyR3w4RNk=;
	b=m1NjXlVYZIu3QBpg/sEp4f+fR88Je9tncYKhuH6tdqmw/LfaksybOskh9FewznSGEA
	cINkEdYN1XVa7P2YAONEeV1nFs6dFMdbv7H7NUe/J0Iw6CPCJdr8EfyRNcQv/cXEP4NQ
	yzhZC1pHw4UYnFKUqzllkBYgxup4v/IBjkfZxSGxUfWIOucXiPv3qS4zuOoafPosUlrc
	Ye0uqPfkYcULTjf41vholtCOophv6c/mOezoPgvQS/lSPMecUBcy/lbU4U5ZRbeVqUsN
	1htymvdIyvybHFXP0941zL+hao3vNRnflZny7kkvdoHV5ycf+ksMunAn5fiyD2rcattT
	RuCA==
X-Received: by 10.140.20.99 with SMTP id 90mr31522624qgi.87.1428531597782;
	Wed, 08 Apr 2015 15:19:57 -0700 (PDT)
Received: from [192.168.0.16] ([201.53.207.14])
	by mx.google.com with ESMTPSA id h3sm8368598qkh.34.2015.04.08.15.19.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 15:19:56 -0700 (PDT)
Message-ID: <5525A98B.80500@gmail.com>
Date: Wed, 08 Apr 2015 19:19:55 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [RFC] Report build
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
X-List-Received-Date: Wed, 08 Apr 2015 22:19:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi,

I would like to share an implementation that I've used with
great success to solve the following situation:

We have a farm server that Jenkins CI has the control. All the
nights a bunch of devel, snapshot and stable builds are fired.
Each machine receives a job that the aim is to build image, SDK,
packages and wic images. After that, all the artifacts are collected
and send to a consolidation server which my users could download.

I believed that many YP users has the very similar settings. So I wanted
to create a solution which is integrated with YP.

This solution involves three things:

* new class to collect the artifacts
* script to send the collected artifacts
* web interface to summaries the results

So I implemented a class called report-build. Once properly setup, it
will collect the artifacts writing in a json file. The meaning of
artifact is: images, packages, sdks, manifest, deploy kernel and bootloader.
After that, all artifact is collected using another script called 
send-build-report. This scripts has
the responsibility to control and send the artifacts (until now using rsync)
to consolidation server.

The consolidation server is a machine running an instance of 
build-report-web that
receives the json payload, creates all the database entry and filesystem 
places where
the artifacts will be placed.

On Jenkins I've created Freestyle jobs that  is setup scripts to build 
the artifacts and
configures the variables that build-report class use:

BUILD_REPORT_DISTRO ?= "${DISTRO}"
BUILD_REPORT_DISTRO_VERSION ?= "${DISTRO_VERSION}"

BUILD_REPORT_JOB_RETENTION ?= "1"
BUILD_REPORT_JOB_ID ?= "job-${DATE}"
BUILD_REPORT_DIR ?= "${LOG_DIR}/build-report"
BUILD_REPORT_SERVER ?= "http://127.0.0.1:8000/Builds"
BUILD_REPORT_USER ?= ""
BUILD_REPORT_EMAIL ?= ""
BUILD_REPORT_TYPE ?= "snapshot"
BUILD_REPORT_DEPLOY_DIR = "${DEPLOY_DIR}"

When the Jenkins runs the job, it only executes the script and 
report-build is in charge to
sends the generated artifacts.

So, the users goes to build-report-web tool and inspects and downloads 
the results.

Here is the very basic web interface:

A home page showing all builds: http://imgur.com/LTqRewq

A detail page to get files (image, sdk, packages): http://imgur.com/gNOtoLO

There are some drawbacks like: the solution uses rsync over ssh to send 
files and
the user must setup ssh keys between build machines and consolidation 
server. But
this is done only once, to setup the initial environment.

This work was based on ideas from:
- report-error
- Error reporting tool

Currently this implementation works using daisy and master. On my 
production environment
I need to use daisy but I am doing the same using master on my free time.


Implementation links:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=joaohf/master-build-report-tool
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=joaohf/build-report-web

Thanks




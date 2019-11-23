Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F2E6B7F7BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 12:50:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n1so11868268wra.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VRaHfJEY/AahFT3Lyqr17jfVIzrhpGDGnDj0XDVk4qE=;
	b=aqWDs9jbVu5NIOFKbXaS6wtpDkdjauMi9dwtBRhoF19W0InR7zDCVMgDcJ2U3/qrmZ
	PLQRgS7Cu9N7homHxjBSRDG/tY1GSFK1C6ScNvu+LS58qHcU86vzZ8ZDdkecgSv5kNlw
	B4g+s1o65FPxZNRavkoNUxlvb7NmErcn6Hdi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VRaHfJEY/AahFT3Lyqr17jfVIzrhpGDGnDj0XDVk4qE=;
	b=caL9h7qtczpvxMsdUR5FU2x1VsE4N8StbkMenYPicJCrUi3qcjR6migLUSxlJ9GQuq
	j8lxsTpclZlrwj6yBrPhIrGZZUb+3GsUXc8dkerNhxuE6jeFhY85W4a/PlPHoQDkpnpV
	D+C5758Nvo6AA1te4mgSh65jUQG/sbpUNeKl1JFkispu6B3owVriA2tqHo+unFvEZgDB
	/WvyfOSEthaDoYb2zIxnjCAG/f6gLM6Xar6O/uCYkrkydlUN4Q6luUYukQEd39bi3eBi
	cS8w3gkHc90DO/Je+qBoeSR7t+RMLhrHEETRHW1HycrUBqzONSpn0sRkGZKJJOubK1zO
	j9Qw==
X-Gm-Message-State: APjAAAX99VSu/QTBZPatiZCFL7yzW7ADECcVMKzBV+2vTbVt8K4ghgUa
	/wJeV6wYpEMOQ0X4FI/30KvQI5n36EI=
X-Google-Smtp-Source: APXvYqylfZ/v6iDBfnrcgKMnwZz2lQu2SjxxjwpuqiHSTNoG487aT9bb/7DoEFDs8aKS4zDu5oYY6g==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr18853523wrs.388.1574513425465; 
	Sat, 23 Nov 2019 04:50:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a26sm1708855wmm.14.2019.11.23.04.50.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 04:50:24 -0800 (PST)
Message-ID: <259c97ddeba6c67c8506eba66a8e4fdbc502dc1d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 12:50:23 +0000
In-Reply-To: <20191121174318.4512-2-Trevor.Gamblin@windriver.com>
References: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
	<20191121174318.4512-2-Trevor.Gamblin@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] coreutils: add ptest
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
X-List-Received-Date: Sat, 23 Nov 2019 12:50:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 12:43 -0500, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> coreutils has a large number of tests, (and potential RDEPENDS
> to support them), including tests added with the flags
> RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that add
> significant run time for their coverage. The RUN_VERY_EXPENSIVE_TESTS
> option has been omitted from the run-ptest script to reduce
> some of this run time, even though this increases the SKIP count
> in the results. Also, the ptest directory for coreutils is given
> blanket permissions at runtime with chmod -R 777 to ensure that
> the user created for the tests will be able to run the test
> scripts and create the necessary files in the process.
> 
> There is still room to improve the results of this ptest without
> the aforementioned additions. Of the tests marked SKIP, there
> are 30 tests that are currently counted as SKIP because they
> require root permissions, and another 21 that require membership
> in multiple user groups. It is important to know that coreutils
> has tests for both root and non-root users. Testing showed that
> 42 tests are skipped when running as root versus 30 when running
> as a non-root user, so the decision was made to run the suite as
> the latter.
> 
> Finally, note that the ptest suite for coreutils has a short
> runtime on x86-64/kvm of approximately 4.5 minutes, in contrast
> to the arm64 runtime of ~70 minutes.

Its good to see this coming together thanks. Unfortunately it failed in
testing.

> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../coreutils/coreutils/run-ptest             | 17 +++++++++
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 38 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest
> 
> diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes-core/coreutils/coreutils/run-ptest
> new file mode 100755
> index 0000000000..683fedee7a
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/run-ptest
> @@ -0,0 +1,17 @@
> +#!/bin/bash
> +
> +COREUTILSLIB=/usr/lib/coreutils
> +LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
> +
> +addgroup usergroup1
> +adduser --ingroup usergroup1 tester
> +
> +su tester -c "make check-TESTS RUN_EXPENSIVE_TESTS=yes top_srcdir=. srcdir=." | tee -a ${LOG}
> +deluser tester 
> +delgroup usergroup1
> +
> +passed=`grep PASS ${LOG}|wc -l`
> +failed=`grep FAIL ${LOG}|wc -l`
> +skipped=`grep -E SKIP ${LOG}|wc -l`
> +all=$((passed + failed + skipped))
> +
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 57b2c1bdba..5ce2730048 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -143,3 +143,41 @@ python __anonymous() {
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +inherit ptest
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> + 
> +SRC_URI += 	"file://run-ptest"


Parsing recipes...WARNING: /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-core/coreutils/coreutils_8.31.bb: Unable to get checksum for coreutils SRC_URI entry run-ptestfile: file could not be found

I think this is a whitespace problem in SRC_URI where file from another
url is being added to the string above.

> +RDEPENDS_${PN}-ptest += "bash findutils gawk gdb glibc libconvert-asn1-perl liberror-perl libmodule-build-perl libtimedate-perl liburi-perl make perl perl-module-file-stat python strace"

Using glibc here breaks musl builds.


In the next version could you please also update:

meta/conf/distro/include/ptest-packagelists.inc

(this would be a slow ptest)

Cheers,

Richard



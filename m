Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA9BC4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 11:46:08 +0000 (UTC)
Received: from h3.cmg2.smtp.forpsi.com (h3.cmg2.smtp.forpsi.com [185.129.138.188])
 by mx.groups.io with SMTP id smtpd.web10.35877.1707651961717371646
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 03:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=nWF+88f+;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=nWF+88f+;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.188, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.90] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id Z8HWrKHxGSqGRZ8HWrbqGh; Sun, 11 Feb 2024 12:45:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1707651959; bh=ncHht0DtDhrtwAphK5sttUEM37ZCl/VKR4esITnJOX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=nWF+88f+eZBH3FRVtRn5D2robupi/0SIZ+dViQ5vu7EUL0PhPSI+8dUdoRYekCVt5
	 R0mGzlltkL9QQ9QONZrWEfcH2hMLfgjeZqHBrPUjtY6F0H7V7Y10bhyNnwj2Bf8rTJ
	 bH2xdm2k87Jq29sZQFl1vEzIvVBqdKXbPnWT5iUBIzQmBX3Uo1iUADA9iHGqPUoexn
	 3ecpAJDupPM/bzQzx6wghlR5jm0qN1wj5anPg0NgEPMLErg+QzoVY+HNjMfkzY0uUx
	 R1hTIITY6C7ouGocUujAOxAeLd7P5SL331hD/0i9iYya21fhHPnLEOljNWCxncrDvy
	 3OoOwzBXfGJag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1707651959; bh=ncHht0DtDhrtwAphK5sttUEM37ZCl/VKR4esITnJOX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=nWF+88f+eZBH3FRVtRn5D2robupi/0SIZ+dViQ5vu7EUL0PhPSI+8dUdoRYekCVt5
	 R0mGzlltkL9QQ9QONZrWEfcH2hMLfgjeZqHBrPUjtY6F0H7V7Y10bhyNnwj2Bf8rTJ
	 bH2xdm2k87Jq29sZQFl1vEzIvVBqdKXbPnWT5iUBIzQmBX3Uo1iUADA9iHGqPUoexn
	 3ecpAJDupPM/bzQzx6wghlR5jm0qN1wj5anPg0NgEPMLErg+QzoVY+HNjMfkzY0uUx
	 R1hTIITY6C7ouGocUujAOxAeLd7P5SL331hD/0i9iYya21fhHPnLEOljNWCxncrDvy
	 3OoOwzBXfGJag==
Message-ID: <c7d59770-b975-4608-ae0d-0ac8dd1531d9@skyrain.eu>
Date: Sun, 11 Feb 2024 12:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: Add selftest for test
 cve_check_ignore
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240210135259.563083-1-simone.p.weiss@posteo.com>
Content-Language: en-US
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <20240210135259.563083-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMnP5vNW7L0cUgIHhTI0ySKmOd1D76+9AmRB0ZdLSqHy5o5p38alBboZCgmX+/G6SlUuauhr8cc1xNF5YVJ8hc4urZVXSpOp79ItC46TdRFVGgbtT4UB
 QDsYeNtkQogx++J+8WG/qfmKWI3ql075wBgc2KJ7yr+5EZQHICtej8FI7ynopkmtN9SJhIYbI4d//1Jot3qyxsuV/3uBaV0q7X9JLLMJ4klKuX1jlri03jQ7
 VQOIFPqhsnATVRYB4ZTkLLO0OthEpgFhQJVIE9xV0IIaZonIsGyFDswi/0PulxY7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 11:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195285

Hi Simone,

Is there a special reason, why you're adding already removed feature 
https://lists.openembedded.org/g/openembedded-core/message/189917 ?

Regards,
Andrej

On 10.02.2024 14:52, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Add a selftest for the recently introduced check for CVE_CHECK_IGNORE.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   .../TestMetadata.test_cve_check_ignore.fail   | 30 ++++++++++++++++++
>   .../TestMetadata.test_cve_check_ignore.pass   | 31 +++++++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
>   create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
>
> diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
> new file mode 100644
> index 0000000000..3574463ade
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
> @@ -0,0 +1,30 @@
> +From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
> +Date: Sat, 10 Feb 2024 13:18:44 +0100
> +Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This should fail the test_cve_tag_format selftest.
> +
> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..3ef9b87c34 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -16,4 +16,5 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++CVE_CHECK_IGNORE = "CVE-2024-12345"
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.39.2
> +
> diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
> new file mode 100644
> index 0000000000..10f942a6eb
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
> @@ -0,0 +1,31 @@
> +From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
> +Date: Sat, 10 Feb 2024 13:23:56 +0100
> +Subject: [PATCH] selftest-hello: add CVE_STATUS
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This should pass the test_cve_tag_format selftest.
> +
> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> +---
> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 547587bef4..9908b3b417 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -16,4 +16,6 @@ do_install() {
> + 	install -m 0755 helloworld ${D}${bindir}
> + }
> +
> +-BBCLASSEXTEND = "native nativesdk"
> +\ No newline at end of file
> ++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
> ++
> ++BBCLASSEXTEND = "native nativesdk"
> +--
> +2.39.2
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195273): https://lists.openembedded.org/g/openembedded-core/message/195273
> Mute This Topic: https://lists.openembedded.org/mt/104277396/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>



Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C9BC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 17:02:12 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.195.1647536531182320553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout03.t-online.de (Postfix) with SMTP id 946EF810
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 18:02:09 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.192]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUtVn-1j9qeP0; Thu, 17 Mar 2022 18:02:07 +0100
Message-ID: <9bc38283-5c2d-c72c-3b60-1cd23c7aed02@t-online.de>
Date: Thu, 17 Mar 2022 18:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical
 version for -cryptography-vectors
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220317164434.387779-1-ross.burton@arm.com>
 <20220317164434.387779-2-ross.burton@arm.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220317164434.387779-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647536527-0001606D-99BBE0F3/0/0 CLEAN NORMAL
X-TOI-MSGID: 60d39807-d0a4-4994-a823-88505f234fdd
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 17:02:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163427

Google perfetto recipes. They are quite crappy, but in case somebody 
wants to play around with it.

Am 17.03.22 um 17:44 schrieb Ross Burton:
> python3-cryptography and python3-cryptography-vectors are actually the
> same project but are on Pypi as two separate modules.
>
> The test suite validates that they're the same version and fails if they
> are not:
>
> FAIL: tests/test_utils.py::test_vector_version
>      def test_vector_version():
>>        assert cryptography.__version__ == cryptography_vectors.__version__
> E       AssertionError: assert '36.0.2' == '36.0.1'
>
> Catch this slightly earlier by mandating that python3-cryptography-ptest
> pulls in an identically versioned python3-cryptography-vectors.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/python/python3-cryptography_36.0.2.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> index 940df60d44..cb3acdf7e2 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> @@ -91,7 +91,7 @@ RDEPENDS:${PN}:append:class-target = " \
>   
>   RDEPENDS:${PN}-ptest += " \
>       ${PYTHON_PN}-bcrypt \
> -    ${PYTHON_PN}-cryptography-vectors \
> +    ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
>       ${PYTHON_PN}-hypothesis \
>       ${PYTHON_PN}-iso8601 \
>       ${PYTHON_PN}-pretend \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163426): https://lists.openembedded.org/g/openembedded-core/message/163426
> Mute This Topic: https://lists.openembedded.org/mt/89849717/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>


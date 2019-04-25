Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3967A7D59E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 03:24:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3P3Odu8026359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Apr 2019 20:24:39 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 24 Apr 2019 20:24:38 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1555664043-329543-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYQeSCoShBRc5SJ9C1+qyFAgxYn7uVYAshFrFGGQAos=Q@mail.gmail.com>
	<5CBFC2C8.2000301@windriver.com>
	<CAJTo0LYTNWiahedBPtGujq9JT53vtWrHw9spOTwgPCmpqkr8tg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CC12A3E.4010702@windriver.com>
Date: Thu, 25 Apr 2019 11:32:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTNWiahedBPtGujq9JT53vtWrHw9spOTwgPCmpqkr8tg@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: fix ptest failures
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
X-List-Received-Date: Thu, 25 Apr 2019 03:24:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月24日 20:07, Burton, Ross wrote:
> On Wed, 24 Apr 2019 at 02:51, Yu, Mingli <mingli.yu@windriver.com> wrote:
>> Per the comments at https://gitlab.gnome.org/GNOME/glib/issues/1357, we
>> need to run test_non_utf8_printf under builddir to guarantee the test
>> passed.
>
> Re-read the comments.  Setting that variable skips the test, as it
> isn't useful without the translations being installed. So, we need to
> install the translations:
>
> root@bob:~# /usr/libexec/installed-tests/glib/gdatetime -p
> /GDateTime/non_utf8_printf
> /GDateTime/non_utf8_printf: **
> GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf:
> assertion failed (__p == ("10\346\234\210")): ("Oct" ==
> "10\346\234\210")
> Aborted (core dumped)
>
> root@bob:~# dnf install glib-2.0-locale-ja
> [ ... ]
> Installed:
>    libglib-2.0-locale-ja-1:2.58.3-r0.corei7_64

Many thanks for Ross's comments!

Yes, it's true. Install libglib-2.0-locale-ja-2.58.3-r0 did silence the 
test_non_utf8_printf failure of gdatetime.test.

But once unset G_TEST_BUILDDIR, we should check the translation modules 
one by one to silence other failures such as below to guarantee 
gdatetime.test passed.

GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1683:test_month_names: 
assertion failed (p_casefold == (o_casefold)): ("sep" == "sept.")
Bail out! 
GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1683:test_month_names: 
assertion failed (p_casefold == (o_casefold)): ("sep" == "sept.")
FAIL: glib/gdatetime.test (Child process killed by signal 6)

Anyway, I will check the translation issues one by one and resent the patch.

Thanks,

>
> root@bob:~# /usr/libexec/installed-tests/glib/gdatetime -p
> /GDateTime/non_utf8_printf
> /GDateTime/non_utf8_printf: OK
>
> Ross
>


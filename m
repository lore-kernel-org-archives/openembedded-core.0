Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0EE67D418
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 01:50:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3O1oq5p022874
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Apr 2019 18:50:52 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 23 Apr 2019 18:50:52 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1555664043-329543-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYQeSCoShBRc5SJ9C1+qyFAgxYn7uVYAshFrFGGQAos=Q@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CBFC2C8.2000301@windriver.com>
Date: Wed, 24 Apr 2019 09:58:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQeSCoShBRc5SJ9C1+qyFAgxYn7uVYAshFrFGGQAos=Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Apr 2019 01:50:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月23日 23:52, Burton, Ross wrote:
> On Fri, 19 Apr 2019 at 09:54, <mingli.yu@windriver.com> wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Set G_TEST_BUILDDIR to mark we run the tests
>>    out of builddir to make it can skip the test_non_utf8_printf
>>    to fix below test error as test_non_utf8_printf needed
>>    to run under builddir per https://gitlab.gnome.org/GNOME/glib/blob/master/glib/tests/gdatetime.c#L1440.
>>    | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
>>    | Bail out! GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
>>    | FAIL: glib/gdatetime.test (Child process killed by signal 6)
>
> As per the link:
>
> /* If running uninstalled (G_TEST_BUILDDIR is set), skip this test, since we
>     * need the translations to be installed. We can’t mess around with
>     * bindtextdomain() here, as the compiled .gmo files in po/ are not in the
>     * right installed directory hierarchy to be successfully loaded by
> gettext. */
>
> Setting G_TEST_BUILDDIR isn't right as we're not running uninstalled.
> This is a gross hack, and not a fix.

Per the comments at https://gitlab.gnome.org/GNOME/glib/issues/1357, we 
need to run test_non_utf8_printf under builddir to guarantee the test 
passed.

Thanks,

>
> Ross
>


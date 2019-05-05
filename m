Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA6CB7D69D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 06:03:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4562p1O022314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 4 May 2019 23:03:02 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sat, 4 May 2019 23:02:41 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <5CC12A3E.4010702@windriver.com>
	<1556610320-114012-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LZnTfeC66-BWnhhXrb6w9eRsUH-hMostVgtKLY4mxwA3A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CCE7E2D.6050008@windriver.com>
Date: Sun, 5 May 2019 14:09:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZnTfeC66-BWnhhXrb6w9eRsUH-hMostVgtKLY4mxwA3A@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: fix ptest failures
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
X-List-Received-Date: Sun, 05 May 2019 06:03:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月30日 21:16, Burton, Ross wrote:
> On Tue, 30 Apr 2019 at 08:45, <mingli.yu@windriver.com> wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Install 7 translation packages to fix 7 ptest
>>    failures such as:
>>    | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
>>    | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1716:test_month_names: assertion failed (p_casefold == (o_casefold)): ("nov" == "stu")
>>    | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1731:test_month_names: assertion failed (p_casefold == (o_casefold)): ("jul" == "liep.")
>
> Would be better if we had a meta-package to install 'all
> translations', but we don't.

>
>> * Increase the timeout to 15 minutes as the default
>>    timeout which is 5 minutes is not enough to fix below error:
>>    | Executing: glib/actions.test
>>    | Test timed out after 300 seconds
>>    | cleaning up pid 13050
>>    | FAIL: glib/actions.test (Child process killed by signal 9)
>
> Looks like we're working around a test case that is going to fail
> because it is timing out.  Let's investigate why it is taking so long
> instead.

The sub-case named test_dbus_threaded[/actions/dbus/threaded] of 
glib/actions.test takes almost most of the time, the more details as below.

# time; /usr/libexec/installed-tests/glib/actions -p;time

user	0m58.87s

sys	0m16.89s

/actions/basic: OK

/actions/name: OK

/actions/simplegroup: OK

/actions/stateful: OK

/actions/default-activate: OK

/actions/entries: OK

/actions/parse-detailed: OK

/actions/property: OK

/actions/dbus/export: OK

/actions/dbus/threaded: OK

/actions/dbus/bug679509: OK

user	11m37.67
s
sys	2m20.77s



# time; /usr/libexec/installed-tests/glib/actions -p; time
user	0m0.11s
sys	0m0.05s
/actions/dbus/threaded: OK
user	6m32.04s
sys	0m55.54s


About the /actions/dbus/threaded,  check 
https://gitlab.gnome.org/GNOME/glib/blob/master/gio/tests/actions.c#L918 
for more details.


# gnome-desktop-testing-runner --help
Usage:
   gnome-desktop-testing-runner [OPTION?] [PREFIX...] - Run installed tests
[snip]
-t, --timeout=TIMEOUT       Cancel test after timeout seconds; defaults 
to 5 minutes
[snip]


If use gnome-desktop-testing-runner to run all the glib-2.0 test, we 
should guarantee all the tests have enough time to run and I don't think 
the below logic is a workaround, we should increase the timeout if use 
gnome-desktop-testing-runner.

-su glib2-test -c gnome-desktop-testing-runner glib
+su glib2-test -c "gnome-desktop-testing-runner glib -t 900"

Thanks,

>
>> * There are 240+ ptest cases for glib-2.0 and one
>>    case is gdatetime.test. And there are 53 sub-cases
>>    under gdatetime.test.
>>
>>    Among of the 53 sub-cases of gdatetime.test, there
>>    is one sub-case named test_month_names.
>>
>>    For test_month_names case, there are also 64 cases
>>    against it. Comment 2 cases of test_month_names
>>    as a workaround to fix the below test_month_names
>>    failure as the issue also exists in the latest version:
>>    | GLib:ERROR:../glib-2.60.1/glib/tests
>>    /gdatetime.c:1702:test_month_names: assertion failed (p_casefold == (o_casefold)): ("\316\261\317\205\316\263" == "\316\261\317\215\316\263")
>>    | GLib:ERROR:../glib-2.60.1/glib/tests/gdatetime.c:1765:test_month_names: assertion failed (p_casefold == (o_casefold)): ("\320\274\320\260\321\217" == "\320\274\320\260\320\271")
>>
>>    Have reported the above issues to upstream as
>>    https://gitlab.gnome.org/GNOME/glib/issues/1759
>>    and as the failure even exists on the latest version 2.60.1
>>    until now, so comment it as a workaround until the
>>    upstream fixs it.
>
> The test is failing and we don't know why, so it should continue to
> fail.  We don't get to 100% pass rate by disabling every test that
> fails.
>
> Can you drop the timeout and datetime test removal, leaving just the
> translation additions?
>
> Ross
>


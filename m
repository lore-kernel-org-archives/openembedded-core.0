Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50E5374197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:43:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA9ChRS1007221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Nov 2015 04:43:27 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 9 Nov 2015 04:43:27 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1445333081.git.liezhi.yang@windriver.com>
	<b6a5e9973afe805490f6aee8967026bc47f2692b.1445333081.git.liezhi.yang@windriver.com>
	<CAJTo0LaOD2_=aDwHi9fjGzWZ2+hcMtUnjHMFsSOTABWiozuSTQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <564094ED.4050402@windriver.com>
Date: Mon, 9 Nov 2015 20:43:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOD2_=aDwHi9fjGzWZ2+hcMtUnjHMFsSOTABWiozuSTQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake-prserv-tool: check file name
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
X-List-Received-Date: Mon, 09 Nov 2015 12:43:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2015 06:33 PM, Burton, Ross wrote:
>
> On 20 October 2015 at 10:25, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Fixed:
>     $ bitbake-prserv-tool import /tmp/1
>        File "/path/to/lib/bb/parse/__init__.py", line 114, in
>     handle(fn='/tmp/1', data=<bb.data_smart.DataSmart object at 0x2369bd0>,
>     include=True):
>                           return h['handle'](fn, data, include)
>          >    raise ParseError("not a BitBake file", fn)
>
>     ParseError: ParseError in /tmp/1: not a BitBake file
>
>     But 1.conf works well, its help also shows "<file.conf>", so check the
>     filename and print proper error message.
>
>
> This breaks the selftest:
>
> ======================================================================
> FAIL: test_import_export_override_db (oeqa.selftest.prservice.BitbakePrTests)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py",
> line 106, in wrapped_f
>      return func(*args, **kwargs)
>    File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
> line 97, in test_import_export_override_db
>      self.run_test_pr_export_import('m4', replace_current_db=False)
>    File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
> line 74, in run_test_pr_export_import
>      self.assertEqual(export_result.status, 0, msg="PR Service database export
> failed: %s" % export_result.output)
> AssertionError: 1 != 0 : PR Service database export failed: ERROR:
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/export.inc
> must end with .conf!
>
> ======================================================================
> FAIL: test_import_export_replace_db (oeqa.selftest.prservice.BitbakePrTests)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py",
> line 106, in wrapped_f
>      return func(*args, **kwargs)
>    File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
> line 93, in test_import_export_replace_db
>      self.run_test_pr_export_import('m4')
>    File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/prservice.py",
> line 74, in run_test_pr_export_import
>      self.assertEqual(export_result.status, 0, msg="PR Service database export
> failed: %s" % export_result.output)
> AssertionError: 1 != 0 : PR Service database export failed: ERROR:
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/export.inc
> must end with .conf!

Maybe selftest should use export.conf rather than export.inc ?

// Robert

>
> Ross


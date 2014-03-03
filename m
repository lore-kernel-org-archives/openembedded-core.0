Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF986EFA9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 09:07:37 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id gl10so4428017lab.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 01:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=kkAqXkiGRnCTKCck2IrNK07GAnIkv3fJBIottrYIrdQ=;
	b=d+UdwsqA06psd5EjWmvKxYrSJVMG45bkcRODscz4q+W06n+M3qBqee/iv0tQWrbaJi
	HtNx7DmtUSk9KUg7SAKe++g+lLL4LH6ZFSdQ6a1/yLEejeLrMgPPzjbX4vSQMwlOMJ09
	VQcLpUaZwpOU3hz37Qg+6enabjh91upOaRSM3SQKg9W2CFalNNUHj3Sib8LNm1PKZqfX
	bucfsidGoO8maFoeHfl5XSQPuLeOBl2P9DD496sZF9/Hz1ODYcZeOu10F5J2RaaawfaY
	+r+5ij2MzUJTVigBFPqwbBFc9BnzCnPAXnVyb9oSeIxoRlfqImxHijuB+3q7UB1FEhSp
	m3qw==
X-Gm-Message-State: ALoCoQlDvkM96W56Wgqsb8nI+C8UOEUrWtbLoZqtBgtON2fGkXy52BSvWayP9Eeu4W5eRsA5B2gH
MIME-Version: 1.0
X-Received: by 10.152.5.229 with SMTP id v5mr22375947lav.11.1393837657517;
	Mon, 03 Mar 2014 01:07:37 -0800 (PST)
Received: by 10.112.91.227 with HTTP; Mon, 3 Mar 2014 01:07:37 -0800 (PST)
In-Reply-To: <26065539-945D-4AB2-8AB3-797BB63B01D3@gmail.com>
References: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
	<5313F632.60207@windriver.com>
	<26065539-945D-4AB2-8AB3-797BB63B01D3@gmail.com>
Date: Mon, 3 Mar 2014 11:07:37 +0200
Message-ID: <CAGNsrLBuZdSP1+UP3xf_AzcpnmUdmSWXN11+ZdDRW-6c9tETKQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: use ln -r to generate relative symlink
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
X-List-Received-Date: Mon, 03 Mar 2014 09:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Same here, daily build failed.

Builders are using latest Ubuntu LTS shipped with coreutils 8.13 version.
--relative is introduced in coreutils 8.16:
http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commit;h=15b8318e93a947d1422e9a927f699eda1085cf0d

On 3 March 2014 05:29, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mar 2, 2014, at 7:25 PM, Lu Chong <Chong.Lu@windriver.com> wrote:
>
>>
>> On 03/01/2014 02:28 AM, Ross Burton wrote:
>>> Instead of using a Python do_install() and calling
>>> oe.path.make_relative_symlink, just pass -r to ln to generate a relative symlink
>>> directly.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>  meta/recipes-core/ncurses/ncurses.inc |   10 ++--------
>>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
>>> index a94466a..835ecc3 100644
>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>> @@ -147,12 +147,7 @@ _install_cfgs = "\
>>>    PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
>>>  "
>>>  -python do_install () {
>>> -    bb.build.exec_func("shell_do_install", d)
>>> -    oe.path.make_relative_symlink(d.expand("${D}${libdir}/libtinfo.so"))
>>> -}
>>> -
>>> -shell_do_install() {
>>> +do_install() {
>>>          # Order of installation is important; widec installs a 'curses.h'
>>>          # header with more definitions and must be installed last hence.
>>>          # Compatibility of these headers will be checked in 'do_test()'.
>>> @@ -226,8 +221,7 @@ shell_do_install() {
>>>                mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
>>>              rm ${D}${libdir}/libtinfo.so
>>> -            # We'll turn this into a relative symlink after do_install returns
>>> -            ln -sf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
>>> +            ln -rsf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
>> Hi Ross,
>>
>> In Ubuntu 12.04, `ln' command doesn't have '-r' option.
>> we will get following error during building ncurses
>>    ln: invalid option -- 'r'
>
>
> count debian in too.
>
>>
>> Best Regards
>> Chong
>>>          fi
>>>            oe_multilib_header curses.h
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Fathi Boudra
Builds and Baselines Manager | Release Manager
Linaro.org | Open source software for ARM SoCs


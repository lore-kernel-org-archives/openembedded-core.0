Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95BA77F350
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 03:46:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8A3kbTF017223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 20:46:37 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 9 Sep 2019 20:46:36 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1566184948-97753-1-git-send-email-changqing.li@windriver.com>
	<55061e6b-3692-fe81-7ecf-be8c629d956e@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <8908f5f4-f786-1481-667f-ad35893cdcc5@windriver.com>
Date: Tue, 10 Sep 2019 11:46:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <55061e6b-3692-fe81-7ecf-be8c629d956e@windriver.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH] populate_sdk: fix populate_sdk failed error
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
X-List-Received-Date: Tue, 10 Sep 2019 03:46:36 -0000
Content-Type: multipart/alternative;
	boundary="------------338594B22003D45385D52CEE"
Content-Language: en-US

--------------338594B22003D45385D52CEE
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

Once we enabled multilib, and IMAGE_INSTALL_append packages that also 
provided by package target-sdk-provides-dummy,

task populate_sdk will failed, similar error like:

Problem: package 
target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
with perl-dev provided by perl-dev-5.30.0-r0.core2_64

On 8/28/19 4:47 PM, Changqing Li wrote:
> ping
>
> On 8/19/19 11:22 AM, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Configuration:
>> IMAGE_INSTALL_append = " bash"
>>
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> Reproduce cmd:
>> bitbake core-image-minimal -c populate_sdk
>>
>> Error info:
>> --> Finished dependency resolution
>> Error:
>>   Problem: package 
>> target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
>> with /bin/sh provided by bash-5.0-r0.core2_64
>>    - package 
>> target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
>> with bash provided by bash-5.0-r0.core2_64
>>    - package 
>> target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
>> with /bin/bash provided by bash-5.0-r0.core2_64
>>    - package 
>> target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target obsoletes 
>> bash provided by bash-5.0-r0.core2_64
>>    - cannot install the best candidate for the job
>>    - conflicting requests
>>
>> when do_populate_sdk, package target-sdk-provides-dummy provides
>> dummy /bin/sh, ... and package bash also provides this, we append
>> dummy arch sdk-provides-dummy-target to the end of 
>> ALL_MULTILIB_PACKAGE_ARCHS,
>> then reverted sdk-provides-dummy-target to the first arch
>> for dnf config  etc/dnf/vars/arch to make it high priority.
>>
>> when multilib is enabled, below statement will not work as expected.
>> ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 
>> 'PACKAGE_ARCHS')}"
>>
>> Eg:
>> For lib32 variant, PACKAGE_ARCHS is:
>> all any noarch x86 qemux86_64 sdk-provides-dummy-target
>>
>> For lib64 variant, PACKAGE_ARCHS is:
>> all any noarch x86_64 core2-64 qemux86_64 sdk-provides-dummy-target
>>
>> Then:
>> ALL_MULTILIB_PACKAGE_ARCHS will be
>> x86 qemux86_64 sdk-provides-dummy-target x86_64 core2-64
>>
>> Fixed by append sdk-provides-dummy-target during do_populate_sdk
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/classes/populate_sdk_base.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass 
>> b/meta/classes/populate_sdk_base.bbclass
>> index 59920a5..3362656 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -21,7 +21,6 @@ def complementary_globs(featurevar, d):
>>   SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs 
>> ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 
>> 'doc-pkgs', '', d)}"
>>   SDKIMAGE_INSTALL_COMPLEMENTARY = 
>> '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
>>   -PACKAGE_ARCHS_append_task-populate-sdk = " sdk-provides-dummy-target"
>>   SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
>>     # List of locales to install, or "all" for all of them, or unset 
>> for none.
>> @@ -130,6 +129,7 @@ def populate_sdk_common(d):
>>       inst_pkgs = (d.getVar("PACKAGE_INSTALL") or "").split()
>>       inst_attempt_pkgs = (d.getVar("PACKAGE_INSTALL_ATTEMPTONLY") or 
>> "").split()
>>   +    d.appendVar('ALL_MULTILIB_PACKAGE_ARCHS', ' 
>> sdk-provides-dummy-target')
>>       d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
>>       d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', ' 
>> '.join(inst_attempt_pkgs))
>
-- 
BRs

Sandy(Li Changqing)


--------------338594B22003D45385D52CEE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>ping <br>
    </p>
    <p>Once we enabled multilib, and IMAGE_INSTALL_append packages that
      also provided by package target-sdk-provides-dummy,</p>
    <p>task populate_sdk will failed, similar error like:</p>
    <p><span style="color: rgb(51, 51, 51); font-family: Arial,
        sans-serif; font-size: 14px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">Problem:
        package
        target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
        conflicts with perl-dev provided by perl-dev-5.30.0-r0.core2_64</span></p>
    <div class="moz-cite-prefix">On 8/28/19 4:47 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:55061e6b-3692-fe81-7ecf-be8c629d956e@windriver.com">ping
      <br>
      <br>
      On 8/19/19 11:22 AM, <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a> wrote:
      <br>
      <blockquote type="cite">From: Changqing Li
        <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
        <br>
        <br>
        Configuration:
        <br>
        IMAGE_INSTALL_append = " bash"
        <br>
        <br>
        require conf/multilib.conf
        <br>
        MULTILIBS = "multilib:lib32"
        <br>
        DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
        <br>
        <br>
        Reproduce cmd:
        <br>
        bitbake core-image-minimal -c populate_sdk
        <br>
        <br>
        Error info:
        <br>
        --&gt; Finished dependency resolution
        <br>
        Error:
        <br>
          Problem: package
        target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
        conflicts with /bin/sh provided by bash-5.0-r0.core2_64
        <br>
           - package
        target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
        conflicts with bash provided by bash-5.0-r0.core2_64
        <br>
           - package
        target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
        conflicts with /bin/bash provided by bash-5.0-r0.core2_64
        <br>
           - package
        target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
        obsoletes bash provided by bash-5.0-r0.core2_64
        <br>
           - cannot install the best candidate for the job
        <br>
           - conflicting requests
        <br>
        <br>
        when do_populate_sdk, package target-sdk-provides-dummy provides
        <br>
        dummy /bin/sh, ... and package bash also provides this, we
        append
        <br>
        dummy arch sdk-provides-dummy-target to the end of
        ALL_MULTILIB_PACKAGE_ARCHS,
        <br>
        then reverted sdk-provides-dummy-target to the first arch
        <br>
        for dnf config  etc/dnf/vars/arch to make it high priority.
        <br>
        <br>
        when multilib is enabled, below statement will not work as
        expected.
        <br>
        ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d,
        'PACKAGE_ARCHS')}"
        <br>
        <br>
        Eg:
        <br>
        For lib32 variant, PACKAGE_ARCHS is:
        <br>
        all any noarch x86 qemux86_64 sdk-provides-dummy-target
        <br>
        <br>
        For lib64 variant, PACKAGE_ARCHS is:
        <br>
        all any noarch x86_64 core2-64 qemux86_64
        sdk-provides-dummy-target
        <br>
        <br>
        Then:
        <br>
        ALL_MULTILIB_PACKAGE_ARCHS will be
        <br>
        x86 qemux86_64 sdk-provides-dummy-target x86_64 core2-64
        <br>
        <br>
        Fixed by append sdk-provides-dummy-target during do_populate_sdk
        <br>
        <br>
        Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
        <br>
        ---
        <br>
          meta/classes/populate_sdk_base.bbclass | 2 +-
        <br>
          1 file changed, 1 insertion(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/meta/classes/populate_sdk_base.bbclass
        b/meta/classes/populate_sdk_base.bbclass
        <br>
        index 59920a5..3362656 100644
        <br>
        --- a/meta/classes/populate_sdk_base.bbclass
        <br>
        +++ b/meta/classes/populate_sdk_base.bbclass
        <br>
        @@ -21,7 +21,6 @@ def complementary_globs(featurevar, d):
        <br>
          SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs
        ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation',
        'doc-pkgs', '', d)}"
        <br>
          SDKIMAGE_INSTALL_COMPLEMENTARY =
        '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
        <br>
          -PACKAGE_ARCHS_append_task-populate-sdk = "
        sdk-provides-dummy-target"
        <br>
          SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
        <br>
            # List of locales to install, or "all" for all of them, or
        unset for none.
        <br>
        @@ -130,6 +129,7 @@ def populate_sdk_common(d):
        <br>
              inst_pkgs = (d.getVar("PACKAGE_INSTALL") or "").split()
        <br>
              inst_attempt_pkgs =
        (d.getVar("PACKAGE_INSTALL_ATTEMPTONLY") or "").split()
        <br>
          +    d.appendVar('ALL_MULTILIB_PACKAGE_ARCHS', '
        sdk-provides-dummy-target')
        <br>
              d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
        <br>
              d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', '
        '.join(inst_attempt_pkgs))
        <br>
          </blockquote>
      <br>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)</pre>
  </body>
</html>

--------------338594B22003D45385D52CEE--

Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE0C73BB7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 06:41:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t596fZUw007598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jun 2015 23:41:35 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 8 Jun 2015 23:41:35 -0700
Message-ID: <55768AB1.9090607@windriver.com>
Date: Tue, 9 Jun 2015 14:41:53 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1432706896.git.Qi.Chen@windriver.com>
	<de9a7a991afa09fbb3994443ae4a0a8d354e5840.1432706896.git.Qi.Chen@windriver.com>
	<4741340.pDCvDy9tKk@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <4741340.pDCvDy9tKk@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [128.224.162.211]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Tue, 09 Jun 2015 06:41:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2015 10:11 PM, Paul Eggleton wrote:
> Hi Qi,
>
> On Wednesday 27 May 2015 14:09:39 Chen Qi wrote:
>> Copy the contents of local.conf under TOPDIR into the final generated
>> local.conf. In this way, custom settings are also made into the final
>> local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx, etc.
>>
>> Before this change, installing extensible SDK would usually report failure
>> when preparing the build system if the user has custom configuration for
>> DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in
>> local.conf also don't get built correctly.
>>
>> This patch solves the above problem.
>>
>> A blacklist mechanism is also introduced so that we can blacklist variables
>> that should not be copied into the final local.conf file. Currently, the
>> blacklist contains 'TMPDIR', 'SSTATE_DIR', 'DL_DIR', 'STAMPS_DIR',
>> 'BASE_WORKDIR' and 'DEPLOY_DIR'. What these variables have in common is
>> that they are set in bitbake.conf using '?=' or '??='.
>>
>> In addition, we check to avoid any setting that might lead to host path
>> bleeding into SDK's configuration.
>>
>> [YOCTO #7616]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/populate_sdk_ext.bbclass | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/meta/classes/populate_sdk_ext.bbclass
>> b/meta/classes/populate_sdk_ext.bbclass index 2fc4c11..49ba26b 100644
>> --- a/meta/classes/populate_sdk_ext.bbclass
>> +++ b/meta/classes/populate_sdk_ext.bbclass
>> @@ -16,6 +16,7 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = "
>> ${SDK_TARGETS}" SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
>>
>>   SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
>> +SDK_META_CONF_BLACKLIST ?= "TMPDIR DL_DIR SSTATE_DIR STAMPS_DIR
>> BASE_WORKDIR DEPLOY_DIR"
>>
>>   SDK_TARGETS ?= "${PN}"
>>   OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
>> @@ -114,6 +115,28 @@ python copy_buildsystem () {
>>           f.write('# this configuration provides, it is strongly suggested
>> that you set\n') f.write('# up a proper instance of the full build system
>> and use that instead.\n\n')
>>
>> +        # Copy configurations from the current local.conf
>> +        builddir = d.getVar('TOPDIR', True)
>> +        with open(builddir + '/conf/local.conf', 'r') as lf:
>> +            varblacklist = d.getVar('SDK_META_CONF_BLACKLIST',
>> True).split() +            skip = False
>> +            for line in lf:
>> +                line = line.lstrip()
>> +                if line.startswith('#'):
>> +                    continue
>> +                # avoid host path bleeding into SDK configuration
>> +                if line.find('"/') != -1:
>> +                    continue
>> +                for varname in varblacklist:
>> +                    if line.startswith(varname):
>> +                        skip = True
>> +                        break
>> +                if not skip:
>> +                    f.write(line)
>> +                skip = False
>> +        f.write('\n')
>> +
>> +        # Configurations in local.conf which are specific for extensible
>> SDK f.write('INHERIT += "%s"\n\n' % 'uninative')
>>           f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))
> I've been thinking about this; since I've recently added edit_metadata() in
> bitbake's lib/bb/utils.py, it would make sense to use that rather than adding
> another piece of code that effectively parses bitbake configuration files (though
> I know this isn't adding much). I know this series has been going back and
> forth for a while now and the delays have largely been my fault, so I'd be
> happy to make this change and resend the series - it's up to you.
>
> Cheers,
> Paul
>

Hi Paul,

Thanks for your suggestion.
I've been looking into edit_metadata(). But it seems that it's used to 
modify *specific* variables.
In this case, we don't know which variables we are going to skip in 
local.conf. We just know that they start with '/'. So I don't see how to 
do it.
I'm not sure if I understand things wrong. Please point it out directly 
if I've missed something.

Best Regards,
Chen Qi


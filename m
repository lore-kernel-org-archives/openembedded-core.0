Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8825478A81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5061; q=dns/txt; s=iport;
	t=1532601583; x=1533811183;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=xLOcZn1hFxMcCkQW/RwD9pwJTNW2mePCE7H8jCQqLxA=;
	b=Lx2eo+CWjX9ktzcbakFVbOmmhlr+lp8+RnZ71kStPwfi0RnSF41fMtYt
	2k8En6gE7kPIlwOBACs8pC3EG1nio+sJh5SX0P2vVDchl4LgWaWIryvxb
	wp0QLyAgRAQ8+WPK4lFoeayn+wBUPxN6mBfjza+Wwgw25OFOuYr9Ir3+u s=;
X-IronPort-AV: E=Sophos;i="5.51,404,1526342400"; 
   d="scan'208";a="5418976"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2018 10:39:41 +0000
Received: from [10.61.214.14] ([10.61.214.14]) (authenticated bits=0)
	by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id w6QAddrY014674
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jul 2018 10:39:40 GMT
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <kergoth@gmail.com>
References: <1511349605-22464-1-git-send-email-rbilovol@cisco.com>
	<6fc7ed17-7619-15b8-fc7e-5fdab594fcbf@cisco.com>
	<CABcZANkLbfW8XcynJmjzWFnzxT_fkxkCqA3OAUDtfqFo-_r95g@mail.gmail.com>
	<1e7b73de0e6a19f5401ed9ab6b206bfc020a8376.camel@linuxfoundation.org>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <e61b5193-9442-4471-9a20-ff35341725fa@cisco.com>
Date: Thu, 26 Jul 2018 13:39:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1e7b73de0e6a19f5401ed9ab6b206bfc020a8376.camel@linuxfoundation.org>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.61.214.14, [10.61.214.14]
X-Outbound-Node: aer-core-1.cisco.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, xe-linux-external@cisco.com
Subject: Re: [PATCH] relocate_sdk.py: remove hardcoded SDK path
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
X-List-Received-Date: Thu, 26 Jul 2018 10:39:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

I see I'm too late and the patch is already reverted. I'll
update it and push again later then.

Thanks,
Ruslan

On 07/25/2018 06:44 PM, Richard Purdie wrote:
> Whilst we merged this, it has unfortunately totally broken uninative-
> tarball. We're under pressure to update to a new uninative to unbreak
> builds on recent distros with sstate sharing and this now blocks doing
> so.
> 
> I can't add the value to the relocate_sdk.py call from
> uninative.bbclass since I don't know what value the tarball would have
> been generated with.
> 
> I suspect I'll have to revert this and then you can work on a way to
> fix this...
> 
> Cheers,
> 
> Richard
> 
> On Tue, 2018-07-17 at 08:22 -0700, Christopher Larson wrote:
>> IMHO this is a solid improvement that should go in.
>>
>> On Tue, Jul 17, 2018 at 8:09 AM Ruslan Bilovol via Openembedded-core
>> <openembedded-core@lists.openembedded.org> wrote:
>>> Hi all,
>>>
>>> Any comments on this patch?
>>>
>>> Thanks
>>> Ruslan
>>>
>>> On 11/22/2017 01:20 PM, Ruslan Bilovol wrote:
>>>> This patch removes hardcodes added to relocate_sdk.py
>>>> during SDK build, making it flexible and reusable.
>>>> Now default SDK path is passed to the script as
>>>> parameter rather then harcoded inside it.
>>>>
>>>> This allows to reuse this script for multiple
>>>> relocations, and adds possibility to relocate
>>>> SDK multiple times
>>>>
>>>> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>>>> ---
>>>>    meta/classes/populate_sdk_base.bbclass |  5 -----
>>>>    meta/files/toolchain-shar-relocate.sh  |  2 +-
>>>>    scripts/relocate_sdk.py                | 17 +++++++++--------
>>>>    3 files changed, 10 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/meta/classes/populate_sdk_base.bbclass
>>> b/meta/classes/populate_sdk_base.bbclass
>>>> index 424c63c..e7aa5a8 100644
>>>> --- a/meta/classes/populate_sdk_base.bbclass
>>>> +++ b/meta/classes/populate_sdk_base.bbclass
>>>> @@ -152,11 +152,6 @@ do_populate_sdk[stamp-extra-info] =
>>> "${MACHINE}${SDKMACHINE}"
>>>>    
>>>>    fakeroot create_sdk_files() {
>>>>        cp ${COREBASE}/scripts/relocate_sdk.py
>>> ${SDK_OUTPUT}/${SDKPATH}/
>>>> -
>>>> -     # Replace the ##DEFAULT_INSTALL_DIR## with the correct
>>> pattern.
>>>> -     # Escape special characters like '+' and '.' in the SDKPATH
>>>> -     escaped_sdkpath=$(echo ${SDKPATH} |sed -e
>>> "s:[\+\.]:\\\\\\\\\0:g")
>>>> -     sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:"
>>> ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
>>>>    }
>>>>    
>>>>    python check_sdk_sysroots() {
>>>> diff --git a/meta/files/toolchain-shar-relocate.sh
>>> b/meta/files/toolchain-shar-relocate.sh
>>>> index e3c1001..f82ff2b 100644
>>>> --- a/meta/files/toolchain-shar-relocate.sh
>>>> +++ b/meta/files/toolchain-shar-relocate.sh
>>>> @@ -36,7 +36,7 @@ if [ x\${PYTHON} = "x"  ]; then
>>>>        echo "SDK could not be relocated.  No python found."
>>>>        exit 1
>>>>    fi
>>>> -\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py
>>> $target_sdk_dir $dl_path $executable_files
>>>> +\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py
>>> $DEFAULT_INSTALL_DIR $target_sdk_dir $dl_path $executable_files
>>>>    EOF
>>>>    
>>>>    $SUDO_EXEC mv $tdir/relocate_sdk.sh
>>> ${env_setup_script%/*}/relocate_sdk.sh
>>>> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
>>>> index c752fa2..0d5a6f5 100755
>>>> --- a/scripts/relocate_sdk.py
>>>> +++ b/scripts/relocate_sdk.py
>>>> @@ -38,8 +38,6 @@ else:
>>>>        def b(x):
>>>>            return x.encode(sys.getfilesystemencoding())
>>>>    
>>>> -old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
>>>> -
>>>>    def get_arch():
>>>>        f.seek(0)
>>>>        e_ident =f.read(16)
>>>> @@ -212,19 +210,22 @@ def change_dl_sysdirs(elf_file_name):
>>>>            f.write(sysdirslen)
>>>>    
>>>>    # MAIN
>>>> -if len(sys.argv) < 4:
>>>> +if len(sys.argv) < 5:
>>>>        sys.exit(-1)
>>>>    
>>>>    # In python > 3, strings may also contain Unicode characters.
>>> So, convert
>>>>    # them to bytes
>>>>    if sys.version_info < (3,):
>>>> -    new_prefix = sys.argv[1]
>>>> -    new_dl_path = sys.argv[2]
>>>> +    new_prefix = sys.argv[2]
>>>> +    new_dl_path = sys.argv[3]
>>>>    else:
>>>> -    new_prefix = sys.argv[1].encode()
>>>> -    new_dl_path = sys.argv[2].encode()
>>>> +    new_prefix = sys.argv[2].encode()
>>>> +    new_dl_path = sys.argv[3].encode()
>>>> +
>>>> +executables_list = sys.argv[4:]
>>>>    
>>>> -executables_list = sys.argv[3:]
>>>> +old_prefix_ne = b(sys.argv[1])
>>>> +old_prefix = re.compile(re.escape(old_prefix_ne));
>>>>    
>>>>    for e in executables_list:
>>>>        perms = os.stat(e)[stat.ST_MODE]
>>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>


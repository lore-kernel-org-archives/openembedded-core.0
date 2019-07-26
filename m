Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id E2B146BE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 18:30:59 +0000 (UTC)
Received: from [192.168.10.150] (87-206-69-189.dynamic.chello.pl
	[87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 2C77F102F12;
	Fri, 26 Jul 2019 18:31:00 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190726153927.14245-1-tworaz@tworaz.net>
	<CAJTo0Lbwj-5k4K8UDVY0cD+eXnSL1Cv1QoR_Ddvfboh3KDkANw@mail.gmail.com>
From: Piotr Tworek <tworaz@tworaz.net>
Message-ID: <aa275fd3-1f67-ae34-86cd-3e761d1c0c8c@tworaz.net>
Date: Fri, 26 Jul 2019 20:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbwj-5k4K8UDVY0cD+eXnSL1Cv1QoR_Ddvfboh3KDkANw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] itstool: Use python3 binary fom PATH instead of /usr/bin/python3
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
X-List-Received-Date: Fri, 26 Jul 2019 18:31:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Ross,

Thanks for looking at my patch. You're right that my explanation behind 
it is a wrong, I was a bit lazy there. Its not really about python3 not 
being installed on the host system. My patch does fix a real issue with 
itstool-native which is currently unusable. The main problem is we can't 
mix host and OE provided python3 usage in one recipe. The problem I 
found is that if  the recipe inherits python3native bbclass any use of 
system provided python3 will fail. This seems to happen because 
python3native bbclass exports 
_PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata". If I try to invoke host 
python3 binary with this export it fails to start.complaining it can't 
find module named _sysconfigdata.

You might ask why nobody noticed it before. The explanation is pretty 
simple. In meta-oe there are two recipes which depend on itstool-native. 
Those are gnome-desktop3 and gnome-system-monitor. Both recipes inherit 
meson class which in turn inherit python3native so in theory they should 
fail. This does not happen because both recipes actually disable 
document generation steps for which itstool is invoked. 
Gnome-system-monitor has a patch for it while gnome-desktop3 has 
desktop_docs=false in EXTRA_OEMESON. I haven't tried it yet, but with my 
patch the document generation step should probably work fine in both 
cases. This was the case for some other gnome related recipes which I 
have in my own custom layer.

Is there anything besides the explanation that is wrong with my patch?

/ptw

On 26/07/2019 17:57, Burton, Ross wrote:
> Considering:
>
> 1) bitbake is written in Python 3
> 2) HOSTTOOLS contains python3
>
> There *really* is a host python 3 binary, and the canonical path to it
> is ${HOSTTOOLS_DIR}/python3.
>
> Ross
>
> On Fri, 26 Jul 2019 at 16:40, Piotr Tworek <tworaz@tworaz.net> wrote:
>> Although /usr/bin/python3 works fine for class-target builds its not
>> really what we want for class-native. The host system might not even
>> have python3 installed. The native itstool version should use pythn3
>> provided in recipe-sysroot-native. To accomplish it modify the default
>> shebang to use /usr/bin/env. This works as expected for both native and
>> target builds.
>>
>> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
>> ---
>>   meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
>> index a0af44a71..f21e7f39b 100644
>> --- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
>> +++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
>> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
>>
>>   do_install_append() {
>>       # fix shebang of main script
>> -    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
>> +    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/env -S ${PYTHON_PN} -s:' ${D}${bindir}/itstool
>>   }
>>
>>   BBCLASSEXTEND = "native"
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


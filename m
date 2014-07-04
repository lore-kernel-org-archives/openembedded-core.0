Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4627B6084E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 11:08:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s64B8iE7011550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Jul 2014 04:08:45 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Fri, 4 Jul 2014 04:08:44 -0700
Message-ID: <53B68B39.1000801@windriver.com>
Date: Fri, 4 Jul 2014 19:08:41 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1404471270-1536-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LZYGaHdzEdf_MYV0bre72gD6y6ma0qqs-ZZCTX_kgmL0A@mail.gmail.com>
In-Reply-To: <CAJTo0LZYGaHdzEdf_MYV0bre72gD6y6ma0qqs-ZZCTX_kgmL0A@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libcroco: dont package /usr/bin/croco-0.6-config
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
X-List-Received-Date: Fri, 04 Jul 2014 11:08:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2014 07:03 PM, Burton, Ross wrote:
> On 4 July 2014 11:54, Ming Liu <ming.liu@windriver.com> wrote:
>> +PACKAGE_PREPROCESS_FUNCS += "croco_package_preprocess"
>> +croco_package_preprocess () {
>> +       if [ -f ${PKGD}/${bindir}/croco-0.6-config ]; then
>> +               rm -f ${PKGD}/${bindir}/croco-0.6-config
>> +       fi
>> +}
> Erm, this is wrong.
>
> So croco-config is broken because the recipe doesn't inherit
> binconfig, to fix the paths and install the binary into libcroco-dev,
> where it belongs.  By not installing it into the package, you've
> broken anything that wants to build using croco-config inside a
> Yocto-generated image, such as the Build Appliance.
>
> Considering that the only recipe to depend on libcroco is librsvg, and
> that uses pkg-config instead of croco-config, then this recipe should
> also inherit binconfig-disabled to turn the config script into a "exit
> 1" no-op.
Yes, you are right! Thanks to correct me, I will send a V2 soon.

the best,
thank you
>
> Ross
>
>



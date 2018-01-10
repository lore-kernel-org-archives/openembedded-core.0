Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39F2578856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 09:45:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0A9jtLM011476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Jan 2018 01:45:55 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 10 Jan 2018 01:45:54 -0800
To: Patrick Ohly <patrick.ohly@intel.com>, =?UTF-8?Q?Jos=c3=a9_Bollo?=
	<jobol@nonadev.net>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
	<1515066650.10775.24.camel@intel.com>
	<7071668FA690C2448AC06FD9CFF240FD014013CF0D@ALA-MBC.corp.ad.wrs.com>
	<1515517307.6718.17.camel@intel.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <c8acc16f-41fa-5818-79a5-78e99eaec6af@windriver.com>
Date: Wed, 10 Jan 2018 17:50:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515517307.6718.17.camel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Wed, 10 Jan 2018 09:45:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 01/10/2018 01:01 AM, Patrick Ohly wrote:
> On Fri, 2018-01-05 at 01:07 +0000, Fan, Wenzong wrote:
>> It works and will override the labels of home dir that SELinux
>> applied, that's the issue.
>>
>> For SELinux enabled system, the user's home dir should have lavel
>> 'user_home_dir_t' instead of 'etc_t', it prevents users from creating
>> files in their home dir.
> 
> Sounds like the "copy xattr" function needs to become a bit smarter: it
> needs to understand some of the semantic involved and skip those
> SELinux xattrs that are always meant to be set dynamically by the
> running kernel.
> 
> Wenzong, which xattrs are those? Do you agree with the proposed
> solution?

The xattr for selinux is "security.selinux":

$ getfattr -n security.selinux /home/t1
security.selinux="user_u:object_r:user_home_dir_t:s0-s15:c0.c1023"

I think the "attr_copy_file()" is doing right thing, but it should be 
used in a limited situation, such as only for Smack ...

Thanks
Wenzong

> 
> Jose, can you look into updating your patch accordingly?
> 


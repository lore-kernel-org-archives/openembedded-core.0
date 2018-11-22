Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFB06C564
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 02:12:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAM2CV4s008549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2018 18:12:31 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 21 Nov 2018 18:12:30 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1542778410.git.Qi.Chen@windriver.com>
	<dc2278cac296d5ad9af04e0de849d0f9e0a0884e.1542778410.git.Qi.Chen@windriver.com>
	<CAJTo0LZRhRoxYXM254vFW61SX5ep4Pu7VBGTDDgTyktz7NXkPA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e88d097c-c9f2-2c07-b307-cf5a522fb3ed@windriver.com>
Date: Thu, 22 Nov 2018 10:19:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZRhRoxYXM254vFW61SX5ep4Pu7VBGTDDgTyktz7NXkPA@mail.gmail.com>
X-Originating-IP: [128.224.163.141]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] busybox: remove three hostname test cases
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
X-List-Received-Date: Thu, 22 Nov 2018 02:12:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2018 08:16 PM, Burton, Ross wrote:
> On Wed, 21 Nov 2018 at 05:35, Chen Qi <Qi.Chen@windriver.com> wrote:
>> These three test case are removed because of two reasons.
>> 1) net-tools' hostname have different behaviour regarding some options
>>     So when net-tools is installed, test cases may fail.
>>     e.g.
>>     test x$(hostname -i) = x$(busybox hostname -i)
> This is just a specific instance of the problem where alternatives may
> not be what you want.  The busybox test suite should be sure it's
> running busybox tools.  Having spoken to a few people about this
> already, maybe busybox-ptest should contain a symlink farm for all the
> applets to the busybox binary that run-ptest can put at the front of
> $PATH.

Very good idea! I'll try this out.

>> 2) hostname may set to some value, e.g. qemux86-64, which is not an entry in /etc/hosts
>>     This results in lookup failure when using `hostname -f' as there's no entry in /etc/hosts.
> Let's fix the hostname setup so hosts is correct too.

OK.
Currently, we set hostname to ${MACHINE}. To ensure it's also an entry 
in /etc/hosts, it seems that we have to default it to 'localhost'. I'm 
going to test with this change. If you have other candidates, please let 
me know.

Best Regards,
Chen Qi

> Ross
>



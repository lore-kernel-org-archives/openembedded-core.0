Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E81B60116
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 01:59:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA21xg3a022213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 1 Nov 2017 18:59:42 -0700
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 1 Nov 2017 18:59:41 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
	<ba38a925299ad32664c35b90486f5c9e97ed64c5.1509516068.git.wenzong.fan@windriver.com>
	<CAP9ODKoLas2y3uyQRV-ewU4u3RQnHW_dMA-WaQb2SiHC6ZWySw@mail.gmail.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <354230d3-d359-6289-47d8-9b4f70d9c556@windriver.com>
Date: Thu, 2 Nov 2017 10:02:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoLas2y3uyQRV-ewU4u3RQnHW_dMA-WaQb2SiHC6ZWySw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] initscripts: disable mountall.sh for busybox init
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
X-List-Received-Date: Thu, 02 Nov 2017 01:59:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/01/2017 08:51 PM, Otavio Salvador wrote:
> Hello,
> 
> On Wed, Nov 1, 2017 at 4:04 AM,  <wenzong.fan@windriver.com> wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Disable 'mountall.sh' to avoid system halt while the init manager is
>> set as 'busybox'.
>>
>> In busybox init, the 'SIGUSR1' was handled as 'halt', calling to the
>> 'mountall.sh' would trigger the signal with:
>>    + kill -USR1 1
> 
> Wouldn't be better to add the signal handler for it?

There's the handler in busybox-1.24.1/init/init.c:

  788 /* The SIGPWR/SIGUSR[12]/SIGTERM handler */
  789 static void halt_reboot_pwoff(int sig) NORETURN;
  790 static void halt_reboot_pwoff(int sig)
  791 {
  ...
  803         run_shutdown_and_kill_processes();
  ...
  817 }

I think it was intended to halt the system.

Thanks
Wenzong

> 


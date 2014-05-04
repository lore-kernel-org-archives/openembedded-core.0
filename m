Return-Path: <joelf@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 58B3260144
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 20:32:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s44KWnQd029247;
	Sun, 4 May 2014 15:32:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s44KWn9J031105;
	Sun, 4 May 2014 15:32:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 May 2014 15:32:49 -0500
Received: from [10.247.29.57] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s44KWnEZ008119;
	Sun, 4 May 2014 15:32:49 -0500
Message-ID: <5366A3EE.1040707@ti.com>
Date: Sun, 4 May 2014 15:32:46 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
	<536613A5.3020003@gmail.com>
In-Reply-To: <536613A5.3020003@gmail.com>
Subject: Re: [PATCH v2] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sun, 04 May 2014 20:32:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/04/2014 05:17 AM, Jonathan Liu wrote:
> On 4/05/2014 9:36 AM, Joel Fernandes wrote:
>> In poky with systemd enabled, vt102 is selected for getty
>> causing user to experience a very crappy terminal. Default
>> TERM to linux.
>>
>> Signed-off-by: Joel Fernandes <joelf@ti.com>
>> ---
>> v2: Dropped PR bump
>>
>>   .../systemd-serialgetty/serial-getty@.service      |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git
>> a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> index 865de34..eb2280b 100644
>> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> @@ -20,6 +20,7 @@ Before=getty.target
>>   IgnoreOnIsolate=yes
>>     [Service]
>> +Environment="TERM=linux"
>>   ExecStart=-/sbin/agetty --keep-baud %I @BAUDRATE@ $TERM
>>   Type=idle
>>   Restart=always
> I would prefer:
> Environment="TERM=xterm"
> ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM
> 
> "xterm" as it is much more widely supported than "linux". Also, PuTTY
> uses "xterm" by default.
> -8 to assume the tty is 8-bit clean and disable parity detection. I have
> had some issues where parity sometimes gets enabled even though the
> serial line is 8-bit clean and I end up with garbage on the serial
> terminal.

Fair enough, I tested and it works fine for me. Will submit a patch.

-Joel


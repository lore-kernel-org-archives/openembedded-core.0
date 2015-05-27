Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD9674230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 14:30:34 +0000 (UTC)
Received: by lbbuc2 with SMTP id uc2so8607329lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=r6a9I3ahViaQCaZMcffLyoXQNNvhrGFTxkexJ1180bs=;
	b=iTex/vmlzqv+pLMWL7vG/VPD3SH1kTWtJRCVVUlNdxCvY7awjj9qzN8nCUGO+jpV6P
	0OeWZu0PMB7h1eYflNSXuy8ZY+kGzuhqpU+X0c9dXDc0b6NU4/ig8l1iAvEcb5kXxT9B
	JA+aEugecfH+Q8M1IaBqi6s9hPGME0ult1tamPNRWvywTPwDYOSroSQUTytgpTusvChA
	mJQEJTGgp9eySVDcKAcxrWBSMk5YC/+zT5Y/gpp66/QRnBq0BbOHj4/3zk+4iaAGdt36
	83A83huzjByYd4uh/XZMPY+EGe/WjvPKRggxQCi9QDSkNDW2koveLehfLLAMmHiuenrf
	8E/w==
X-Received: by 10.152.43.37 with SMTP id t5mr27560974lal.96.1432737035197;
	Wed, 27 May 2015 07:30:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.27.15 with HTTP; Wed, 27 May 2015 07:30:14 -0700 (PDT)
In-Reply-To: <5564E473.4090400@linux.intel.com>
References: <1432147458-28773-1-git-send-email-anibal.limon@linux.intel.com>
	<5564E473.4090400@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 27 May 2015 16:30:14 +0200
Message-ID: <CAPybu_26nd5Lshq552+gP-q+s5_JWfGgJeJ4movVF+_tqby31g@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] xserver-nodm: Support reboot from inside X
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
X-List-Received-Date: Wed, 27 May 2015 14:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I tested the proposed change and works also fine.


Thanks!

On Tue, May 26, 2015 at 11:24 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> ping...
>
>
> On 20/05/15 13:44, An=C3=ADbal Lim=C3=B3n wrote:
>>
>> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>
>> If reboot was called from inside the Xserver there could happen a race
>> condition where chvt would never end, and therefore the whole system was
>> stalled.
>>
>> The user could not recover the system by ssh the machine or using the
>> keyboard.
>>
>> Running chvt in background fixes the issue.
>>
>> Also move sleep 1s inside stop to give time for killproc xinit for
>> fix issue when chvt 1 don't work because X server is still running.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> ---
>>   meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 4 ++=
--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> index 2e3e090..bfa0a8d 100755
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> @@ -48,12 +48,12 @@ case "$1" in
>>     stop)
>>           echo "Stopping XServer"
>>           killproc xinit
>> -        chvt 1
>> +        sleep 1
>> +        chvt 1 &
>>     ;;
>>       restart)
>>         $0 stop
>> -        sleep 1
>>           $0 start
>>     ;;
>>
>
>



--=20
Ricardo Ribalda


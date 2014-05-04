Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCA7605B2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 10:17:42 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so2466424pab.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=oHjC914bGp4/U08Xu9ENrjP90qY+XdtnBJyyPWubwG0=;
	b=pfbYzx2Ue/Vdi8iiNxqb/GD+lU2oF+UNI2N97enVDET5f+Ppxb4qQNZKkG9AC2AyQN
	VycgbEyW7NOOY9MFJqFuW9o+3X6yt3O+NKKLThCOQbAInxEb03bDFiDxThePljoxUdXI
	E0d8fsZ69729xnVfdz0Aabo0TlsvLnRD4favMoBKq/oytKnBtxW2bcZAz6KEor1GiHVV
	zxhOrFUzx1pB+c+temcOQXrR5ObAOQO1Jhf1Wm6ARG4zB33Mv/pg7jZG+2somzfj75/f
	O68nIR0lwdsHVD8TzEyG/dQ5g/eyzmgg1S/5s5nBbdOiQ2T7Ft2gyLCarI6fJXRLD8pu
	oBhA==
X-Received: by 10.66.240.70 with SMTP id vy6mr27261119pac.80.1399198662742;
	Sun, 04 May 2014 03:17:42 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	au16sm41725813pac.27.2014.05.04.03.17.40 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 May 2014 03:17:41 -0700 (PDT)
Message-ID: <536613A5.3020003@gmail.com>
Date: Sun, 04 May 2014 20:17:09 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Joel Fernandes <joelf@ti.com>, 
 openembedded-core@lists.openembedded.org
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
In-Reply-To: <1399160215-16270-1-git-send-email-joelf@ti.com>
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
X-List-Received-Date: Sun, 04 May 2014 10:17:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/05/2014 9:36 AM, Joel Fernandes wrote:
> In poky with systemd enabled, vt102 is selected for getty
> causing user to experience a very crappy terminal. Default
> TERM to linux.
>
> Signed-off-by: Joel Fernandes <joelf@ti.com>
> ---
> v2: Dropped PR bump
>
>   .../systemd-serialgetty/serial-getty@.service      |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> index 865de34..eb2280b 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> @@ -20,6 +20,7 @@ Before=getty.target
>   IgnoreOnIsolate=yes
>   
>   [Service]
> +Environment="TERM=linux"
>   ExecStart=-/sbin/agetty --keep-baud %I @BAUDRATE@ $TERM
>   Type=idle
>   Restart=always
I would prefer:
Environment="TERM=xterm"
ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM

"xterm" as it is much more widely supported than "linux". Also, PuTTY 
uses "xterm" by default.
-8 to assume the tty is 8-bit clean and disable parity detection. I have 
had some issues where parity sometimes gets enabled even though the 
serial line is 8-bit clean and I end up with garbage on the serial terminal.

Regards,
Jonathan


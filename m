Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UXZDC-00059m-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 17:44:54 +0200
Received: by mail-pa0-f50.google.com with SMTP id bg2so909427pad.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tjsdviXU+xtplo+sbfAQl7X2+CBBK5uBrtTXzxEzyMY=;
	b=jRxTaUep9imSwGvouBTqueH1esiS1+iY67I05FdJOqMaafnDtiav2fvnCb/PS/ReSj
	PDRCu6GoCSk/i4nwGsP27dlbIUaulRUpAYV6EurMsWdlS9S4nFQY5NdmlUPI9Z9yVurt
	0E87EQNRs0rFBwNqzd1esc4wjeELwXoDxzhgfdV82H06QnLdRuLgp4whGhutTpQ97lOa
	2gKibHaLeA5PVe5VBW+B1W7CTFeotFI4iNwF2oWpXdtF6tfrihoDE8ssOLhkuGCQLkMJ
	CeAtfwc1NG15IiZaxTxTiO12IxuTibABz8TOSTUlXxG2HdWAXinHHWlHAXcAvkOZy36e
	eCqA==
X-Received: by 10.68.189.67 with SMTP id gg3mr4598183pbc.141.1367422021116;
	Wed, 01 May 2013 08:27:01 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id to7sm4115481pab.0.2013.05.01.08.26.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 08:27:00 -0700 (PDT)
Message-ID: <5181332B.9070303@gmail.com>
Date: Thu, 02 May 2013 01:22:19 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1367418158-28751-1-git-send-email-net147@gmail.com>
In-Reply-To: <1367418158-28751-1-git-send-email-net147@gmail.com>
Subject: Re: [PATCH] boot-directdisk: Fix race condition with bootimg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 15:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/05/2013 12:22 AM, Jonathan Liu wrote:
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index d265485..fcbee8a 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -96,5 +96,5 @@ python do_bootdirectdisk() {
>       bb.build.exec_func('build_boot_dd', d)
>   }
>   
> -addtask bootdirectdisk before do_build
> +addtask bootdirectdisk after do_bootimg before do_build
>   do_bootdirectdisk[nostamp] = "1"
The strange thing is, it seems the generated .hdddirect has two copies 
of the root filesystem - one in rootfs.img in the fat partition, and one 
as an ext3 partition.
So maybe there is another conflict with bootimg that needs to be considered.

Regards,
Jonathan



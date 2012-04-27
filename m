Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1SNo2W-00039r-49
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 18:29:00 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm19so690534bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 09:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=FI3yR4Q5TfYTt77RqLLAOhFTyrJ8mM2WrLZgXGa5e7Q=;
	b=mc9NQ7zAFO3k0netW6Zgy5cYeQ1+H0T3K7RHP7w50O/9op4nljPJpXeZZtHeSonK+1
	Q5gzbeSobcdlLQ0d68TyQwURrqgUxGUY96rHW0H0/ZgMvV/qvDSXQqDueRJ06uPdfFkc
	ULvL4J/orijqlbzit4+FD9KWAHrwncD/fePcQ0Rn7KK2Om7AsmQ/PJ8jPW7hc8V0BPwh
	yUvymRAYANWU41SxAwL8Y4sh2zTx2lKf2PlsOsjBNKg0rJ/MJULkiIv+YeKQW8ALabLF
	Hw0vFED3DhsAIMtJNjClsTdzsT9Xg1IKPubC9TwPdh+S4/nyvtaAetL+9lin7YdcJg/I
	E41Q==
Received: by 10.205.129.8 with SMTP id hg8mr4125913bkc.25.1335543563906;
	Fri, 27 Apr 2012 09:19:23 -0700 (PDT)
Received: from [9.152.213.70] (deibp9eh1--blueice2n2.emea.ibm.com.
	[195.212.29.172])
	by mx.google.com with ESMTPS id c4sm12603780bkh.0.2012.04.27.09.19.22
	(version=SSLv3 cipher=OTHER); Fri, 27 Apr 2012 09:19:22 -0700 (PDT)
Message-ID: <4F9AC709.2020006@linaro.org>
Date: Fri, 27 Apr 2012 18:19:21 +0200
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
	<20120427145304.04e483d3@eb-e6520>
In-Reply-To: <20120427145304.04e483d3@eb-e6520>
X-Gm-Message-State: ALoCoQm9vmeBuBAE4D5Ss5NfCuxHtmGnU+AJfmwk0L4e9lC1/dkzrod70OgfW3q7Vcg9z9GeRI6i
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Qt 4.8 GCC 4.7 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2012 16:29:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 04/27/2012 02:53 PM, Eric Bénard wrote:
> Hi Ken,
>
> Le Fri, 27 Apr 2012 12:59:17 +0200,
> Ken Werner<ken.werner@linaro.org>  a écrit :
>
>> This change introduces two new patches to Qt 4.8. One prevents the build
>> system from using the -fuse-ld=gold GCC flag as this isn't upstream and
>> therefore not supported by many toolchains out there. The second patch
>
> ld-is-gold is a DISTRO_FEATURES wich enables gold (and thus reduce link
> time especially in qt's build) : has this patch an effect on the
> possibility to still use gold ?
>
> Eric

No, the patch doesn't prevent the toolchain from linking using gold. 
Upstream GCC+binutils supports either gold or the classic ld - a 
decision you make at the configure time of your toolchain. However, 
Debian and Ubuntu have patched their toolchains to allow the user to 
pick the desired linker using the -fuse-ld option. Technically what they 
do is a patch to the binutils which installs both the ld.bfd and ls.gold 
plus a symlink that selects the default linker. And a GCC patch that 
changes collect2 to support the -fuse-ld switch.

Regards,
Ken



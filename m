Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 204946AE73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:02:59 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id w7so593850lbi.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=VnVgBJYhvs6jNqtx8HNS0g/iRvaTJyi7mZ7lYsmxmN8=;
	b=M1FCHUoPZnyOfa5Ooih/NfQoeOvvVpehdS1rf6Y+RsxM5IMz+SNHMqyoCsDgzipyxz
	gXSUWAI2OIDGGHOncEZthUAdAxHs+r7HJqD4Slyw7ObakN5l6b5NUTHIL8hNsHR7n1lp
	fOd22/l9wt+hGazYMvSDHm6pFuzkb6naeOh3/UOp6CaphFw0GQrH391vVKlqXtLPoDH2
	6IhteVtg4qqmulASf+Y/p9YOFXBRCCb9zz9PbqIfMAAPUF4zDpcv81uefZRIcMP95fXC
	Sr88GDmLbQE+ZuJoFecPZ01HKNzuOuWAs/6vhD1ed5s+hTB17mCKjbrv40aJ1H7AeGmT
	oIzg==
X-Received: by 10.152.8.47 with SMTP id o15mr2052781laa.20.1390413780461;
	Wed, 22 Jan 2014 10:03:00 -0800 (PST)
Received: from [172.16.141.123] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id m3sm8350913lbp.13.2014.01.22.10.02.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 10:02:59 -0800 (PST)
Message-ID: <52E007CC.5070405@gmail.com>
Date: Wed, 22 Jan 2014 19:02:52 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKr4WxcPVkxGMR+ZZ98b6mLbmUyr9Qs=BWe-S5HVJSn=hg@mail.gmail.com>
In-Reply-To: <CAP9ODKr4WxcPVkxGMR+ZZ98b6mLbmUyr9Qs=BWe-S5HVJSn=hg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 18:03:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 22 jan 2014 16:47:06, Otavio Salvador wrote:
> On Wed, Jan 22, 2014 at 1:08 PM, David Nyström
> <david.c.nystrom@gmail.com> wrote:
>> Adding ability to use postinstalls intercepts in the nativesdk env, and
>> making sure the correlate between repo + SDK.
>>
>> This to enable rootfs generation from a package repository using only a
>> package repository and the toolchain tarball.
>>
>> See https://github.com/nysan/rootfs-sandbox for examples.
>>
>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>
> Much better. Thanks.
>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Regarding the rootfs-sandbox, how are you intending to proper
> integrate it with the toolchain?
>

Search the oe-core list for the previous discussions with Tom Zanussi.
I believe the long term goals is to redo rootfs_*.bbclass in python, 
and let both bitbake and MIC(WIC) use
the same code for image creation.(SDK env + bitbake env.)

I'm fine with continued dev/inclusion of rootfs-sandbox, but I think 
that might not be acceptable as a long term solution since
it may be maintenance heavy, since it uses alot of oe-core internal 
env. vars.

Possible routes are:
1. Use common code for rootfs assembly. (WIC)
2. Cleanup env. var. usage in postinstall hooks, and be aggressive in 
denying new additions. (Continue dev. on rootfs-sandbox)

Off-topic:
With above patches, I'm down to 1 postinstall failures for 
packagegroup-core-lsb:
1. missing shlibsign, (nss), cant get the damn thing to compile for 
nativesdk yet.

There are 2 other failures as well, but they fail when bitbake:ing as 
well.
Only works well with ipk sofar.

Br,
David



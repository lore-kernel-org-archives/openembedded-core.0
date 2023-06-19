Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C514EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:19:44 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.8697.1687184380483997147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=3kvz/xRX;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76257c11363so175944285a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687184379; x=1689776379;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEKv4TItvGXJdDQy+xM9+dEWcm/53bKuvlWJDYqNumE=;
        b=3kvz/xRXoikJipzjR4ZPKAf5pqzspQ4AlLIBZ38DedbdNVoqQMR9w8wuSFMDSZSdCt
         oYW+Cm5iyspgdKyTBcQHWX2VcbMLwZl2GvY47XFYzwf+QiHtGofxiP0viLOYel08mBZY
         hpvCk0vxAZtt5lpYHLF81baEgQ4HgGBakvulRuf8KnifCKqaQe+nuz6KUFRaCiW5vBDZ
         ABrIms95BB7X+hdS5VdhuE3vG1jo0P/vZzUY3nN52jD9jLJJeMLFulHL958OalBY1K3i
         /maYx3BL5f/IdQCoO3eqKRsBPkF4ur1IkwE4T+Ldl83thzucGozzVgutwWOxoXlNnKj7
         ec1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184379; x=1689776379;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEKv4TItvGXJdDQy+xM9+dEWcm/53bKuvlWJDYqNumE=;
        b=E4CLt/a6hw+6bnPVKdlgzH9JqhKJpymr/vNQebKYyW5x1ekcUMnYvuzOyzZy/RyNRI
         V10Lfx0QgxETMnDkc0FSvknQPjwZMapO0qr+VnEgxV5gjhOwcBoM8aacWXGoqZE8pG/V
         x8AR8ASJybzk2we5pcynaJRAwXsd0J3ORtMzOR8kJdga2xJ5xcpFUooSSgddu79SfebT
         2wumLhuHgz4zZJs1aGjf14bPk/mECe4uIFwPYtm+5saTY/KHnVzHJar+IDJGBwTNhp9a
         aRNVQk7t8V5iTILOZMEoDllnX0Er5DiyIbNAwp7heUf0mQN1bs4XHIJGIKy4gZ6cQDXZ
         r7ng==
X-Gm-Message-State: AC+VfDyp6h7rVssVUKEgayKBIculLqadUxxDuz1Hu9Tem6RLVoKJaLQM
	/h+fyqYmL5Io3xliSfcf5PTcJA==
X-Google-Smtp-Source: ACHHUZ6EnL/d60q6Ke2kZcV/zdhVL8dPAqDFf6z52woaIIzqpk2PRmsYwGOM4gzBMv4FpsM5X3auDw==
X-Received: by 2002:a05:620a:3725:b0:75b:23a0:de9d with SMTP id de37-20020a05620a372500b0075b23a0de9dmr12362529qkb.27.1687184379598;
        Mon, 19 Jun 2023 07:19:39 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5? ([2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5])
        by smtp.gmail.com with ESMTPSA id m2-20020ae9f202000000b00761fae866c7sm6342747qkg.76.2023.06.19.07.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 07:19:39 -0700 (PDT)
Message-ID: <ef3d8471-22f1-7b0b-48f6-25a096a28d42@baylibre.com>
Date: Mon, 19 Jun 2023 10:19:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] runqemu-gen-tapdevs: pass STAGING_BINDIR_NATIVE
 to ifup
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230619135416.1640748-1-tgamblin@baylibre.com>
 <d114391afb2fb86d115abb740af5a4a9473848b6.camel@linuxfoundation.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <d114391afb2fb86d115abb740af5a4a9473848b6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183116


On 2023-06-19 10:03, Richard Purdie wrote:
> On Mon, 2023-06-19 at 09:54 -0400, Trevor Gamblin wrote:
>> Without this, runqemu-gen-tapdevs fails with the following error:
>>
>> [tgamblin@megalith build]$ sudo /workspace/yocto/manual/poky/scripts/runqemu-gen-tapdevs 1000 1002 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
>> Creating 4 tap devices for UID: 1000 GID: 1002...
>> Creating tap0
>> Error bringing up interface: sudo runqemu-ifup <uid> <gid> <native-sysroot-basedir>
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   scripts/runqemu-gen-tapdevs | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
>> index ec3ecb03b9..dc730e413d 100755
>> --- a/scripts/runqemu-gen-tapdevs
>> +++ b/scripts/runqemu-gen-tapdevs
>> @@ -79,7 +79,7 @@ fi
>>   echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
>>   for ((index=0; index < $COUNT; index++)); do
>>   	echo "Creating tap$index"
>> -	if ! ifup=`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
>> +	if ! ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`; then
>>   		echo "Error bringing up interface: $ifup"
>>   		exit 1
>>   	fi
> I'm a bit puzzled as I removed the use of STAGING_BINDIR_NATIVE in that
> script?
STAGING_BINDIR_NATIVE is still present near the top of the script as a 
variable but isn't used anywhere. When I encountered the error and saw 
that the script wasn't passing a path, I thought including it again 
would fix it. It appears to do so on my Fedora build system.
>
> Are you mixing different releases?
I'm using the latest poky master.
>
> Cheers,
>
> Richard
>


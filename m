Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531B7C433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 14:09:01 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.7212.1632578940793198298
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 07:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q8R2MY3/;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id w8so12839374pgf.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PdT5J09AjC5ciSz755BHDfCNM596Dsi7MDd4ktxZhVQ=;
        b=Q8R2MY3/eHlXKCBbQXLCX+bfW7G21TDHN+TKwBc+ApgXzX/B2nfNzfGKkM70nbkoQl
         2N6jWHK+cgWLkn5k6E0vSqmItydjVIGa+ZCr5teeBXiUTExrlbAJMCv7z5vWBWzeWLFZ
         kSeQ2tL7454MlDSivi1N6hYaX5Iy1bHXeDB+9dLsERCkma+wdowJDkF74UxyPRUfXh0y
         zAHcAOlFgFTA7gacc3r9SA2PhSmf/MMfh/YhnFdRyAUEIdUFLFmizNdArKaKVT1fmXXh
         jNK1UmI1xGzNiltoAITTw3BvB3qlaH00DjJJtcDNJIEwDutCyOZt9CXMykcYVZbGgT7O
         HDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PdT5J09AjC5ciSz755BHDfCNM596Dsi7MDd4ktxZhVQ=;
        b=IPDFukR0a9nHC7vdxnFwAOlbKxWGg6JVcgWNvWTnI0W6pZMmL0zP+2+4ryd2PBQK+s
         QUr9I6OzEjQsuhJIiBrOvEz3h8MJEhKISTwX6VwB7cpTkt8DJCCHpr8mB0EnKxmROKB1
         JwJdz600NU7qPVJ7AA6YpZICJPOUZszlVy7AixYW04o4YBE8jqNlhnNg0yu/Lo7LiQvh
         /v7hKGGEM54eHFQKTKUWvH4dPRuvIR8C1EhB0v7GOJquu3AggArhZQFX6PjOMlHYCZdP
         dJJMDHpziYwMCCz/+VHsCFol5h0adFst+72fAZMQrlx+aZ568BB9d2SfSGdNAInp0i5+
         07yQ==
X-Gm-Message-State: AOAM5308h2vCap4elndCfDkYtTyC9FW7GqC/PHwL27itFRtZZDTsNm4R
	TdQX276dwVeGaOlIT1cT89A=
X-Google-Smtp-Source: 
 ABdhPJwgB+JGPuzGRg+lRF+OoAayf4Xam76HAuuTfiF8LrTaLP2TQEOO7+QscOTCR8PUJz6OnxpURA==
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr1758101pgm.214.1632578940156;
        Sat, 25 Sep 2021 07:09:00 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:e468:d37:2b84:ad60?
 ([2601:646:9200:a0f0:e468:d37:2b84:ad60])
        by smtp.gmail.com with ESMTPSA id
 r29sm12268374pfq.74.2021.09.25.07.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 07:08:59 -0700 (PDT)
Message-ID: <9e8e0aed-b7d3-201c-46c2-e827334f7912@gmail.com>
Date: Sat, 25 Sep 2021 07:08:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [PATCH] pseudo_db: Flush DB if there is a shutdown
 request
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
References: <20210925093539.1780545-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210925093539.1780545-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 14:09:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156348



On 9/25/21 2:35 AM, Richard Purdie wrote:
> We have some challenges in ensuring the pseudo database is flushed to disk
> in things like docker containers since the processes can be killed with no
> warning at container termination. Rightly or wrongly, we need to handle this
> better.
> 
> There is no current way to flush the DB but there is a shutdoen request

typo shutdoen/shutdown

> mechanism. Whilst we can't force a shutdown from bitbake due to the multiple
> connected clients and the existing 3s shutdown isn't enough, we can take the
> hint to flush the DB at this time. Further writes are unlikely.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   pseudo_db.c     | 2 +-
>   pseudo_db.h     | 1 +
>   pseudo_server.c | 1 +
>   3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/pseudo_db.c b/pseudo_db.c
> index 6c48cc8..14bafcb 100644
> --- a/pseudo_db.c
> +++ b/pseudo_db.c
> @@ -399,7 +399,7 @@ signed_ino(ino_t ino) {
>   
>   #ifdef USE_MEMORY_DB
>   
> -static void
> +void
>   pdb_backup() {
>           sqlite3_backup *pBackup;
>           /* no point in doing this if we don't have a database to back up,
> diff --git a/pseudo_db.h b/pseudo_db.h
> index 5a4aa59..9d01232 100644
> --- a/pseudo_db.h
> +++ b/pseudo_db.h
> @@ -26,6 +26,7 @@ typedef struct {
>   	char *program;
>   } log_entry;
>   
> +extern void pdb_backup(void);
>   extern int pdb_maybe_backup(void);
>   extern int pdb_cancel_unlink_file(pseudo_msg_t *msg);
>   extern int pdb_did_unlink_file(char *path, pseudo_msg_t *msg, int deleting);
> diff --git a/pseudo_server.c b/pseudo_server.c
> index 84cef05..815c76b 100644
> --- a/pseudo_server.c
> +++ b/pseudo_server.c
> @@ -568,6 +568,7 @@ serve_client(int i) {
>   				}
>   				in->pathlen = (s - response_path) + 1;
>   				/* exit quickly once clients go away, though */
> +                               pdb_backup();
>   				pseudo_server_timeout = 3;
>   			} else {
>   				in->type = PSEUDO_MSG_ACK;
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156343): https://lists.openembedded.org/g/openembedded-core/message/156343
> Mute This Topic: https://lists.openembedded.org/mt/85857567/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


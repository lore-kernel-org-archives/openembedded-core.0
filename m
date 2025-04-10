Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACE0C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:44:25 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.7626.1744314263146543466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7OaW5SJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8ffa00555so9868096d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744314262; x=1744919062; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LQL8R4rbOaKr0B/xdz/AYSlBjXjjZ7dj+96gFwm45os=;
        b=Z7OaW5SJ4IjOYqapPO57b4K0GC0PIpawr8+P2AXXGr5/1tFG4UJYK/TELoaxL0Eywk
         /F33iUTfldcXYQwcPh00UCV5TFzDRVF0w2yhbhNJBbVsCr2LSTZhD0jW9o9IY2mXHtKQ
         ZhRufJFxpj+K9WtIaZo9CHVTLSZB3papCI4obgGLBT/Bspe6/TxhbNtjtKeyIdHocnZM
         a/svobwFA3AnjcqqN65KXr4T9peNgHQ/WEhBHOKTUIoIm1QbpSkiTqaMiopnp+6znRl9
         Lm8v0XL4yUeQsaGo6CLmoJJ2q413+9jKql/8XdXJkpAyx6N+bYA02fDYOzhHgUFQpj5K
         1dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744314262; x=1744919062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQL8R4rbOaKr0B/xdz/AYSlBjXjjZ7dj+96gFwm45os=;
        b=TqiQpb/Rt6K0nDk93sK54A3k5HAoWoMsZtVOFDTyTpRNw1FUwYLoIoM80jNNJbkTrL
         PPvVaN1QfFLQdkWD/Sx9sFB7RHP82ApEmu43McXe1ishVd+lKisPDFpJW4nZ95EoeiJX
         Gru+kHksePpZ1CRMAYxJbxuz0iWZZlQ93vwP/c5znaCMsN9XookqIpi6mYfxpQ0lu0Do
         fJb1jqDgWauRVTXz2xif5sz8DP3n152J2/I9FDxmM8qU2See3r/tTt7/g+7KwrXBnC/X
         L59Etn82qGj575jbjNjgutCsonziTj/Fk3LonNydkCTZJ6J6REETFa4bAWYGO2Iq5KtA
         mlgg==
X-Gm-Message-State: AOJu0YzEsB5dDC6phjaLY7w2FyWpk3iQ5bwE/hNRiyDjQha95PP7W/yy
	51N6JIJ51OEvIJ6qJC08X6GOVBnfO0+1EcQ57wI4TMM+hbsSqH4+lS0TYWt68ut4VfEhBNqsWEf
	gK3Lhtw2sQXSPPW6OGV2R76NqFr0=
X-Gm-Gg: ASbGncv7Tf1HM3ptYYHI4+SfvKabMO6uetxrB7DkO5J9FVNvM3sb0/J0ir1HOnTnh4N
	fNuZcMK0EwVEETgaFD/27HsjaQ8qTiV2cEF02wIA3U4qqI84dks4DsiCrFf55kuE2yJ/TicUg/b
	GnBROYtmp08hkBUA0dqOTx3T+CAUI0W7ZCx1vjw441Unyuh0DM/FmlJIY6
X-Google-Smtp-Source: AGHT+IGRt95SPqoMzBCqOzwoerYD+kKZ9rEAKd1odjKeMZCShW+nLm/qM0DHSuZSJgGPP1f8GtYxaoFZockPhvSsiQQ=
X-Received: by 2002:a05:6214:acb:b0:6e8:89bd:2b50 with SMTP id
 6a1803df08f44-6f230cbb4edmr2262376d6.7.1744314262064; Thu, 10 Apr 2025
 12:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250410102401.122070-1-jaeyoon.jung@lge.com>
In-Reply-To: <20250410102401.122070-1-jaeyoon.jung@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 21:44:11 +0200
X-Gm-Features: ATxdqUHzxyhLQ4GrV2OH_kadvAe1zwEusecOiiIkZbDnz4be7D3fJTLmRhZ73vA
Message-ID: <CANNYZj-y_UpumftTEKm0s7otVFiCRc21us3p5EmKe5go_hhhjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] send-error-report: Respect URL scheme in server
 name if exists
To: jaeyoon.jung@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214707

Thanks, this looks good and will be taken into patch testing queue,
but I wonder if we can simplify this further, and drop --no-ssl option
altogether. It would be a breaking change, but in master it's
possible. If you would like, you can send a second patch on top of
this one, with the option removal.

Alex

On Thu, 10 Apr 2025 at 12:24, Jaeyoon Jung (LGE) via
lists.openembedded.org <jaeyoon.jung=lge.com@lists.openembedded.org>
wrote:
>
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> If a server name with -s or --server flag contains the URL scheme such
> as http:// or https:// it takes precedence over --no-ssl flag. This will
> allow us to use the same command line option for different servers with
> http:// and https:// schemes mixed.
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
>  scripts/send-error-report | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/send-error-report b/scripts/send-error-report
> index cfbcaa52cb..1e973f1cb2 100755
> --- a/scripts/send-error-report
> +++ b/scripts/send-error-report
> @@ -65,7 +65,7 @@ def edit_content(json_file_path):
>
>  def prepare_data(args):
>      # attempt to get the max_log_size from the server's settings
> -    max_log_size = getPayloadLimit(args.protocol+args.server+"/ClientPost/JSON")
> +    max_log_size = getPayloadLimit(args.server+"/ClientPost/JSON")
>
>      if not os.path.isfile(args.error_file):
>          log.error("No data file found.")
> @@ -135,9 +135,9 @@ def send_data(data, args):
>      headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
>
>      if args.json:
> -        url = args.protocol+args.server+"/ClientPost/JSON/"
> +        url = args.server+"/ClientPost/JSON/"
>      else:
> -        url = args.protocol+args.server+"/ClientPost/"
> +        url = args.server+"/ClientPost/"
>
>      req = urllib.request.Request(url, data=data, headers=headers)
>      try:
> @@ -149,6 +149,23 @@ def send_data(data, args):
>      print(response.read().decode('utf-8'))
>
>
> +def determine_server_url(args):
> +    # Get the error report server from the environment variable
> +    server = args.server or 'errors.yoctoproject.org'
> +
> +    # The scheme contained in the given URL takes precedence over --no-ssl flag
> +    scheme = args.protocol
> +    if server.startswith('http://'):
> +        server = server[len('http://'):]
> +        scheme = 'http://'
> +    elif server.startswith('https://'):
> +        server = server[len('https://'):]
> +        scheme = 'https://'
> +
> +    # Construct the final URL
> +    return f"{scheme}{server}"
> +
> +
>  if __name__ == '__main__':
>      arg_parse = argparse_oe.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
>
> @@ -164,8 +181,7 @@ if __name__ == '__main__':
>      arg_parse.add_argument("-s",
>                             "--server",
>                             help="Server to send error report to",
> -                           type=str,
> -                           default="errors.yoctoproject.org")
> +                           type=str)
>
>      arg_parse.add_argument("-e",
>                             "--email",
> @@ -195,10 +211,10 @@ if __name__ == '__main__':
>                             dest="protocol",
>                             action="store_const", const="http://", default="https://")
>
> -
> -
>      args = arg_parse.parse_args()
>
> +    args.server = determine_server_url(args)
> +
>      if (args.json == False):
>          print("Preparing to send errors to: "+args.server)
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214640): https://lists.openembedded.org/g/openembedded-core/message/214640
> Mute This Topic: https://lists.openembedded.org/mt/112188628/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


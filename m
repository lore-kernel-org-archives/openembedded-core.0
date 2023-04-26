Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D0BC7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 15:59:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.12451.1682524779305931203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 08:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ifHgP9cA;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so54858410a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682524777; x=1685116777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAQ9Gsn4zJS5Poleg8m3BkA1QTspR7knm7tkIcO54e8=;
        b=ifHgP9cAVFTzbgVVRWHT3psIXt5u8/+dFbn3yDHz363AGTSve73eSGV+RRmBl2YkXi
         Xegxm5mGnG8CieC770548zHMpfnblTbKRnWQFqI9qOJomHIqoqpqccsMLT5y7DRWI/aX
         IaQmHUwDepakUxsr1AO2uWR6a+9+W3WExDjDhuEBEFtzMt0Cr2KXfUlHI5UfJwdnceli
         7SnLDxLBhDHL1Iilc7jxfB5XShpxFzniWNLxzkBFZMtn8pZHZpsOxMAeYos0c4c5H1N6
         Lk5IE85ms0DPSbZHBJhi2oyo0XA3uKcHmIjrFD+21joaUw7mOQBXFsfdHDWxybksFGH9
         pgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682524777; x=1685116777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAQ9Gsn4zJS5Poleg8m3BkA1QTspR7knm7tkIcO54e8=;
        b=IhtazDhuWvHbYyw0XRpjsxo09X6p+Y1LJgQy4+DpJIYqrThqyl1eZN4544js5ZVzl7
         /yAAcIa/AGCPIFStNG9DNjaDTWKDWtsnziDiirkICbo15RqRhuJRXblskykPEl/XcToC
         NaHOz2jfqi7BIim6en17wSQjNKvkajspd+OJDT+vWmTAIyYmhquGF2FfRCpCxN8LL51X
         w6JlRTiOL6PkToy+O24/tbBbNkAurtvRPMriqPSAlOognr66ToMskvdoHGgNoZXMzaRd
         u8dItziPs0KbXrHw4qjnzG1W/Pfxd0dEzEgLXjXMmr6yA48VlI0CIbr8WuPcgJO5idi5
         YpMg==
X-Gm-Message-State: AC+VfDxgsvtRc3EYX43UKoabL9HLdpP5NHvb4Oy0ysyPCnap1E4OZ2UI
	AlUm5LFJcBhg2lSK2Jj69InC6H1bc2nuM77dhlmdNMx5dh7NRQk0T3U=
X-Google-Smtp-Source: ACHHUZ7C9CVWp/4Jl6f48wQ74Lfdo/BplqUSN/Xt62afHqFQNHZaB55Po0+RfM6EpioDP5KxWOfuSOd4C01pG4p1Dco=
X-Received: by 2002:aa7:cd8c:0:b0:4fd:1f7b:9fbd with SMTP id
 x12-20020aa7cd8c000000b004fd1f7b9fbdmr3062810edv.6.1682524776975; Wed, 26 Apr
 2023 08:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230426081745.182677-1-vanusuri@mvista.com>
In-Reply-To: <20230426081745.182677-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Apr 2023 05:59:26 -1000
Message-ID: <CAOSpxdYrfr0ovAaV5oTnNGOZKkB_hGFaWT2VnzwC1Hk2g=KKXQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: Security fix CVE-2023-27533,
 CVE-2023-27535, CVE-2023-27536 and CVE-2023-27538
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 15:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180447

Hi Vijay,

We already have a patch for CVE-2023-27538:

https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3Db27=
40d1ff74b2c55011b5d4230c7b06b5109376d

Could you submit a v2 taking this into consideration?

Thanks for helping with CVEs!

Steve

On Tue, Apr 25, 2023 at 10:18=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com=
> wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/curl/=
tree/debian/patches?h=3Dubuntu/focal-security & https://github.com/curl/cur=
l/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684 & https://github.com/curl=
/curl/commit/ed5095ed94281989e103c72e032200b83be37878 & https://github.com/=
curl/curl/commit/f18af4f874cecab82a9797e8c7541e0990c7a64c & https://github.=
com/curl/curl/commit/8f4608468b890dce2dad9f91d5607ee7e9c1aba1 & https://git=
hub.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 & https:/=
/github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../curl/curl/CVE-2023-27533.patch            |  59 +++++
>  .../curl/curl/CVE-2023-27535-pre1.patch       | 236 ++++++++++++++++++
>  .../curl/curl/CVE-2023-27535.patch            | 170 +++++++++++++
>  .../curl/curl/CVE-2023-27536.patch            |  55 ++++
>  .../curl/curl/CVE-2023-27538.patch            |  29 +++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   5 +
>  6 files changed, 554 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535-pre1.pa=
tch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27533.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27533.patch
> new file mode 100644
> index 0000000000..64ba135056
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
> @@ -0,0 +1,59 @@
> +Backport of:
> +
> +From 538b1e79a6e7b0bb829ab4cecc828d32105d0684 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 6 Mar 2023 12:07:33 +0100
> +Subject: [PATCH] telnet: only accept option arguments in ascii
> +
> +To avoid embedded telnet negotiation commands etc.
> +
> +Reported-by: Harry Sintonen
> +Closes #10728
> +
> +Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/curl/tree/debian/patches/CVE-2023-27533.patch?h=3Dubuntu/foc=
al-security
> +Upstream commit https://github.com/curl/curl/commit/538b1e79a6e7b0bb829a=
b4cecc828d32105d0684]
> +CVE: CVE-2023-27533
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/telnet.c | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +--- a/lib/telnet.c
> ++++ b/lib/telnet.c
> +@@ -815,6 +815,17 @@ static void printsub(struct Curl_easy *d
> +   }
> + }
> +
> ++static bool str_is_nonascii(const char *str)
> ++{
> ++  size_t len =3D strlen(str);
> ++  while(len--) {
> ++    if(*str & 0x80)
> ++      return TRUE;
> ++    str++;
> ++  }
> ++  return FALSE;
> ++}
> ++
> + static CURLcode check_telnet_options(struct connectdata *conn)
> + {
> +   struct curl_slist *head;
> +@@ -829,6 +840,8 @@ static CURLcode check_telnet_options(str
> +   /* Add the user name as an environment variable if it
> +      was given on the command line */
> +   if(conn->bits.user_passwd) {
> ++    if(str_is_nonascii(data->conn->user))
> ++      return CURLE_BAD_FUNCTION_ARGUMENT;
> +     msnprintf(option_arg, sizeof(option_arg), "USER,%s", conn->user);
> +     beg =3D curl_slist_append(tn->telnet_vars, option_arg);
> +     if(!beg) {
> +@@ -844,6 +857,9 @@ static CURLcode check_telnet_options(str
> +     if(sscanf(head->data, "%127[^=3D ]%*[ =3D]%255s",
> +               option_keyword, option_arg) =3D=3D 2) {
> +
> ++      if(str_is_nonascii(option_arg))
> ++        continue;
> ++
> +       /* Terminal type */
> +       if(strcasecompare(option_keyword, "TTYPE")) {
> +         strncpy(tn->subopt_ttype, option_arg, 31);
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch b/m=
eta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
> new file mode 100644
> index 0000000000..034b72f7e6
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
> @@ -0,0 +1,236 @@
> +From ed5095ed94281989e103c72e032200b83be37878 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 6 Oct 2022 00:49:10 +0200
> +Subject: [PATCH] strcase: add and use Curl_timestrcmp
> +
> +This is a strcmp() alternative function for comparing "secrets",
> +designed to take the same time no matter the content to not leak
> +match/non-match info to observers based on how fast it is.
> +
> +The time this function takes is only a function of the shortest input
> +string.
> +
> +Reported-by: Trail of Bits
> +
> +Closes #9658
> +
> +Upstream-Status: Backport from [https://github.com/curl/curl/commit/ed50=
95ed94281989e103c72e032200b83be37878 & https://github.com/curl/curl/commit/=
f18af4f874cecab82a9797e8c7541e0990c7a64c]
> +Comment: to backport fix for CVE-2023-27535, add function Curl_timestrcm=
p.
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/netrc.c             |  6 +++---
> + lib/strcase.c           | 22 ++++++++++++++++++++++
> + lib/strcase.h           |  1 +
> + lib/url.c               | 33 +++++++++++++--------------------
> + lib/vauth/digest_sspi.c |  4 ++--
> + lib/vtls/vtls.c         | 21 ++++++++++++++++++++-
> + 6 files changed, 61 insertions(+), 26 deletions(-)
> +
> +diff --git a/lib/netrc.c b/lib/netrc.c
> +index 9323913..fe3fd1e 100644
> +--- a/lib/netrc.c
> ++++ b/lib/netrc.c
> +@@ -124,9 +124,9 @@ static int parsenetrc(const char *host,
> +           /* we are now parsing sub-keywords concerning "our" host */
> +           if(state_login) {
> +             if(specific_login) {
> +-              state_our_login =3D strcasecompare(login, tok);
> ++              state_our_login =3D !Curl_timestrcmp(login, tok);
> +             }
> +-            else if(!login || strcmp(login, tok)) {
> ++            else if(!login || Curl_timestrcmp(login, tok)) {
> +               if(login_alloc) {
> +                 free(login);
> +                 login_alloc =3D FALSE;
> +@@ -142,7 +142,7 @@ static int parsenetrc(const char *host,
> +           }
> +           else if(state_password) {
> +             if((state_our_login || !specific_login)
> +-                && (!password || strcmp(password, tok))) {
> ++               && (!password || Curl_timestrcmp(password, tok))) {
> +               if(password_alloc) {
> +                 free(password);
> +                 password_alloc =3D FALSE;
> +diff --git a/lib/strcase.c b/lib/strcase.c
> +index 70bf21c..ec776b3 100644
> +--- a/lib/strcase.c
> ++++ b/lib/strcase.c
> +@@ -261,6 +261,28 @@ bool Curl_safecmp(char *a, char *b)
> +   return !a && !b;
> + }
> +
> ++/*
> ++ * Curl_timestrcmp() returns 0 if the two strings are identical. The ti=
me this
> ++ * function spends is a function of the shortest string, not of the con=
tents.
> ++ */
> ++int Curl_timestrcmp(const char *a, const char *b)
> ++{
> ++  int match =3D 0;
> ++  int i =3D 0;
> ++
> ++  if(a && b) {
> ++    while(1) {
> ++      match |=3D a[i]^b[i];
> ++      if(!a[i] || !b[i])
> ++        break;
> ++      i++;
> ++    }
> ++  }
> ++  else
> ++    return a || b;
> ++  return match;
> ++}
> ++
> + /* --- public functions --- */
> +
> + int curl_strequal(const char *first, const char *second)
> +diff --git a/lib/strcase.h b/lib/strcase.h
> +index 8929a53..8077108 100644
> +--- a/lib/strcase.h
> ++++ b/lib/strcase.h
> +@@ -49,5 +49,6 @@ void Curl_strntoupper(char *dest, const char *src, siz=
e_t n);
> + void Curl_strntolower(char *dest, const char *src, size_t n);
> +
> + bool Curl_safecmp(char *a, char *b);
> ++int Curl_timestrcmp(const char *first, const char *second);
> +
> + #endif /* HEADER_CURL_STRCASE_H */
> +diff --git a/lib/url.c b/lib/url.c
> +index 9f14a7b..dfbde3b 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -886,19 +886,10 @@ socks_proxy_info_matches(const struct proxy_info* =
data,
> +   /* the user information is case-sensitive
> +      or at least it is not defined as case-insensitive
> +      see https://tools.ietf.org/html/rfc3986#section-3.2.1 */
> +-  if((data->user =3D=3D NULL) !=3D (needle->user =3D=3D NULL))
> +-    return FALSE;
> +-  /* curl_strequal does a case insentive comparison, so do not use it h=
ere! */
> +-  if(data->user &&
> +-     needle->user &&
> +-     strcmp(data->user, needle->user) !=3D 0)
> +-    return FALSE;
> +-  if((data->passwd =3D=3D NULL) !=3D (needle->passwd =3D=3D NULL))
> +-    return FALSE;
> ++
> +   /* curl_strequal does a case insentive comparison, so do not use it h=
ere! */
> +-  if(data->passwd &&
> +-     needle->passwd &&
> +-     strcmp(data->passwd, needle->passwd) !=3D 0)
> ++  if(Curl_timestrcmp(data->user, needle->user) ||
> ++     Curl_timestrcmp(data->passwd, needle->passwd))
> +     return FALSE;
> +   return TRUE;
> + }
> +@@ -1257,10 +1248,10 @@ ConnectionExists(struct Curl_easy *data,
> +       if(!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) {
> +         /* This protocol requires credentials per connection,
> +            so verify that we're using the same name and password as wel=
l */
> +-        if(strcmp(needle->user, check->user) ||
> +-           strcmp(needle->passwd, check->passwd) ||
> +-           !Curl_safecmp(needle->sasl_authzid, check->sasl_authzid) ||
> +-           !Curl_safecmp(needle->oauth_bearer, check->oauth_bearer)) {
> ++        if(Curl_timestrcmp(needle->user, check->user) ||
> ++           Curl_timestrcmp(needle->passwd, check->passwd) ||
> ++           Curl_timestrcmp(needle->sasl_authzid, check->sasl_authzid) |=
|
> ++           Curl_timestrcmp(needle->oauth_bearer, check->oauth_bearer)) =
{
> +           /* one of them was different */
> +           continue;
> +         }
> +@@ -1326,8 +1317,8 @@ ConnectionExists(struct Curl_easy *data,
> +            possible. (Especially we must not reuse the same connection =
if
> +            partway through a handshake!) */
> +         if(wantNTLMhttp) {
> +-          if(strcmp(needle->user, check->user) ||
> +-             strcmp(needle->passwd, check->passwd)) {
> ++          if(Curl_timestrcmp(needle->user, check->user) ||
> ++             Curl_timestrcmp(needle->passwd, check->passwd)) {
> +
> +             /* we prefer a credential match, but this is at least a con=
nection
> +                that can be reused and "upgraded" to NTLM */
> +@@ -1348,8 +1339,10 @@ ConnectionExists(struct Curl_easy *data,
> +           if(!check->http_proxy.user || !check->http_proxy.passwd)
> +             continue;
> +
> +-          if(strcmp(needle->http_proxy.user, check->http_proxy.user) ||
> +-             strcmp(needle->http_proxy.passwd, check->http_proxy.passwd=
))
> ++          if(Curl_timestrcmp(needle->http_proxy.user,
> ++                             check->http_proxy.user) ||
> ++             Curl_timestrcmp(needle->http_proxy.passwd,
> ++                             check->http_proxy.passwd))
> +             continue;
> +         }
> +         else if(check->proxy_ntlm_state !=3D NTLMSTATE_NONE) {
> +diff --git a/lib/vauth/digest_sspi.c b/lib/vauth/digest_sspi.c
> +index a109056..3986386 100644
> +--- a/lib/vauth/digest_sspi.c
> ++++ b/lib/vauth/digest_sspi.c
> +@@ -450,8 +450,8 @@ CURLcode Curl_auth_create_digest_http_message(struct=
 Curl_easy *data,
> +      has changed then delete that context. */
> +   if((userp && !digest->user) || (!userp && digest->user) ||
> +      (passwdp && !digest->passwd) || (!passwdp && digest->passwd) ||
> +-     (userp && digest->user && strcmp(userp, digest->user)) ||
> +-     (passwdp && digest->passwd && strcmp(passwdp, digest->passwd))) {
> ++     (userp && digest->user && Curl_timestrcmp(userp, digest->user)) ||
> ++     (passwdp && digest->passwd && Curl_timestrcmp(passwdp, digest->pas=
swd))) {
> +     if(digest->http_context) {
> +       s_pSecFn->DeleteSecurityContext(digest->http_context);
> +       Curl_safefree(digest->http_context);
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index e8cb70f..70a9391 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -98,9 +98,15 @@ Curl_ssl_config_matches(struct ssl_primary_config* da=
ta,
> +      Curl_safecmp(data->issuercert, needle->issuercert) &&
> +      Curl_safecmp(data->clientcert, needle->clientcert) &&
> +      Curl_safecmp(data->random_file, needle->random_file) &&
> +-     Curl_safecmp(data->egdsocket, needle->egdsocket) &&
> ++     Curl_safecmp(data->egdsocket, needle->egdsocket) &&
> ++#ifdef USE_TLS_SRP
> ++     !Curl_timestrcmp(data->username, needle->username) &&
> ++     !Curl_timestrcmp(data->password, needle->password) &&
> ++     (data->authtype =3D=3D needle->authtype) &&
> ++#endif
> +      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &=
&
> +      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list1=
3) &&
> ++     Curl_safe_strcasecompare(data->CRLfile, needle->CRLfile) &&
> +      Curl_safe_strcasecompare(data->pinned_key, needle->pinned_key))
> +     return TRUE;
> +
> +@@ -117,6 +123,9 @@ Curl_clone_primary_ssl_config(struct ssl_primary_con=
fig *source,
> +   dest->verifyhost =3D source->verifyhost;
> +   dest->verifystatus =3D source->verifystatus;
> +   dest->sessionid =3D source->sessionid;
> ++#ifdef USE_TLS_SRP
> ++  dest->authtype =3D source->authtype;
> ++#endif
> +
> +   CLONE_STRING(CApath);
> +   CLONE_STRING(CAfile);
> +@@ -127,6 +136,11 @@ Curl_clone_primary_ssl_config(struct ssl_primary_co=
nfig *source,
> +   CLONE_STRING(cipher_list);
> +   CLONE_STRING(cipher_list13);
> +   CLONE_STRING(pinned_key);
> ++  CLONE_STRING(CRLfile);
> ++#ifdef USE_TLS_SRP
> ++  CLONE_STRING(username);
> ++  CLONE_STRING(password);
> ++#endif
> +
> +   return TRUE;
> + }
> +@@ -142,6 +156,11 @@ void Curl_free_primary_ssl_config(struct ssl_primar=
y_config* sslc)
> +   Curl_safefree(sslc->cipher_list);
> +   Curl_safefree(sslc->cipher_list13);
> +   Curl_safefree(sslc->pinned_key);
> ++  Curl_safefree(sslc->CRLfile);
> ++#ifdef USE_TLS_SRP
> ++  Curl_safefree(sslc->username);
> ++  Curl_safefree(sslc->password);
> ++#endif
> + }
> +
> + #ifdef USE_SSL
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27535.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27535.patch
> new file mode 100644
> index 0000000000..e38390a57c
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27535.patch
> @@ -0,0 +1,170 @@
> +From 8f4608468b890dce2dad9f91d5607ee7e9c1aba1 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 9 Mar 2023 17:47:06 +0100
> +Subject: [PATCH] ftp: add more conditions for connection reuse
> +
> +Reported-by: Harry Sintonen
> +Closes #10730
> +
> +Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/curl/tree/debian/patches/CVE-2023-27535.patch?h=3Dubuntu/foc=
al-security
> +Upstream commit https://github.com/curl/curl/commit/8f4608468b890dce2dad=
9f91d5607ee7e9c1aba1]
> +CVE: CVE-2023-27535
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/ftp.c     | 30 ++++++++++++++++++++++++++++--
> + lib/ftp.h     |  5 +++++
> + lib/setopt.c  |  2 +-
> + lib/url.c     | 16 +++++++++++++++-
> + lib/urldata.h |  4 ++--
> + 5 files changed, 51 insertions(+), 6 deletions(-)
> +
> +diff --git a/lib/ftp.c b/lib/ftp.c
> +index 31a34e8..7a82a74 100644
> +--- a/lib/ftp.c
> ++++ b/lib/ftp.c
> +@@ -4059,6 +4059,10 @@ static CURLcode ftp_disconnect(struct connectdata=
 *conn, bool dead_connection)
> +   }
> +
> +   freedirs(ftpc);
> ++  free(ftpc->account);
> ++  ftpc->account =3D NULL;
> ++  free(ftpc->alternative_to_user);
> ++  ftpc->alternative_to_user =3D NULL;
> +   free(ftpc->prevpath);
> +   ftpc->prevpath =3D NULL;
> +   free(ftpc->server_os);
> +@@ -4326,11 +4330,31 @@ static CURLcode ftp_setup_connection(struct conn=
ectdata *conn)
> +   struct Curl_easy *data =3D conn->data;
> +   char *type;
> +   struct FTP *ftp;
> ++  struct ftp_conn *ftpc =3D &conn->proto.ftpc;
> +
> +-  conn->data->req.protop =3D ftp =3D calloc(sizeof(struct FTP), 1);
> ++  ftp =3D calloc(sizeof(struct FTP), 1);
> +   if(NULL =3D=3D ftp)
> +     return CURLE_OUT_OF_MEMORY;
> +
> ++  /* clone connection related data that is FTP specific */
> ++  if(data->set.str[STRING_FTP_ACCOUNT]) {
> ++    ftpc->account =3D strdup(data->set.str[STRING_FTP_ACCOUNT]);
> ++    if(!ftpc->account) {
> ++      free(ftp);
> ++      return CURLE_OUT_OF_MEMORY;
> ++    }
> ++  }
> ++  if(data->set.str[STRING_FTP_ALTERNATIVE_TO_USER]) {
> ++    ftpc->alternative_to_user =3D
> ++      strdup(data->set.str[STRING_FTP_ALTERNATIVE_TO_USER]);
> ++    if(!ftpc->alternative_to_user) {
> ++      Curl_safefree(ftpc->account);
> ++      free(ftp);
> ++      return CURLE_OUT_OF_MEMORY;
> ++    }
> ++  }
> ++  conn->data->req.protop =3D ftp;
> ++
> +   ftp->path =3D &data->state.up.path[1]; /* don't include the initial s=
lash */
> +
> +   /* FTP URLs support an extension like ";type=3D<typecode>" that
> +@@ -4366,7 +4390,9 @@ static CURLcode ftp_setup_connection(struct connec=
tdata *conn)
> +   /* get some initial data into the ftp struct */
> +   ftp->transfer =3D FTPTRANSFER_BODY;
> +   ftp->downloadsize =3D 0;
> +-  conn->proto.ftpc.known_filesize =3D -1; /* unknown size for now */
> ++  ftpc->known_filesize =3D -1; /* unknown size for now */
> ++  ftpc->use_ssl =3D data->set.use_ssl;
> ++  ftpc->ccc =3D data->set.ftp_ccc;
> +
> +   return CURLE_OK;
> + }
> +diff --git a/lib/ftp.h b/lib/ftp.h
> +index 984347f..163dcb3 100644
> +--- a/lib/ftp.h
> ++++ b/lib/ftp.h
> +@@ -116,6 +116,8 @@ struct FTP {
> +    struct */
> + struct ftp_conn {
> +   struct pingpong pp;
> ++  char *account;
> ++  char *alternative_to_user;
> +   char *entrypath; /* the PWD reply when we logged on */
> +   char **dirs;   /* realloc()ed array for path components */
> +   int dirdepth;  /* number of entries used in the 'dirs' array */
> +@@ -141,6 +143,9 @@ struct ftp_conn {
> +   ftpstate state; /* always use ftp.c:state() to change state! */
> +   ftpstate state_saved; /* transfer type saved to be reloaded after
> +                            data connection is established */
> ++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for F=
TP or
> ++                              IMAP or POP3 or others! (type: curl_usess=
l)*/
> ++  unsigned char ccc;       /* ccc level for this connection */
> +   curl_off_t retr_size_saved; /* Size of retrieved file saved */
> +   char *server_os;     /* The target server operating system. */
> +   curl_off_t known_filesize; /* file size is different from -1, if wild=
card
> +diff --git a/lib/setopt.c b/lib/setopt.c
> +index 4d96f6b..a91bb70 100644
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -2126,7 +2126,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURL=
option option, va_list param)
> +     arg =3D va_arg(param, long);
> +     if((arg < CURLUSESSL_NONE) || (arg >=3D CURLUSESSL_LAST))
> +       return CURLE_BAD_FUNCTION_ARGUMENT;
> +-    data->set.use_ssl =3D (curl_usessl)arg;
> ++    data->set.use_ssl =3D (unsigned char)arg;
> +     break;
> +
> +   case CURLOPT_SSL_OPTIONS:
> +diff --git a/lib/url.c b/lib/url.c
> +index dfbde3b..f84375c 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1257,10 +1257,24 @@ ConnectionExists(struct Curl_easy *data,
> +         }
> +       }
> +
> +-      if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_=
SSH) {
> ++#ifdef USE_SSH
> ++      else if(get_protocol_family(needle->handler->protocol) & PROTO_FA=
MILY_SSH) {
> +         if(!ssh_config_matches(needle, check))
> +           continue;
> +       }
> ++#endif
> ++#ifndef CURL_DISABLE_FTP
> ++      else if(get_protocol_family(needle->handler->protocol) & PROTO_FA=
MILY_FTP) {
> ++        /* Also match ACCOUNT, ALTERNATIVE-TO-USER, USE_SSL and CCC opt=
ions */
> ++        if(Curl_timestrcmp(needle->proto.ftpc.account,
> ++                           check->proto.ftpc.account) ||
> ++           Curl_timestrcmp(needle->proto.ftpc.alternative_to_user,
> ++                           check->proto.ftpc.alternative_to_user) ||
> ++           (needle->proto.ftpc.use_ssl !=3D check->proto.ftpc.use_ssl) =
||
> ++           (needle->proto.ftpc.ccc !=3D check->proto.ftpc.ccc))
> ++          continue;
> ++      }
> ++#endif
> +
> +       if(!needle->bits.httpproxy || (needle->handler->flags&PROTOPT_SSL=
) ||
> +          needle->bits.tunnel_proxy) {
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index 168f874..51b793b 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1730,8 +1730,6 @@ struct UserDefined {
> +   void *ssh_keyfunc_userp;         /* custom pointer to callback */
> +   enum CURL_NETRC_OPTION
> +        use_netrc;        /* defined in include/curl.h */
> +-  curl_usessl use_ssl;   /* if AUTH TLS is to be attempted etc, for FTP=
 or
> +-                            IMAP or POP3 or others! */
> +   long new_file_perms;    /* Permissions to use when creating remote fi=
les */
> +   long new_directory_perms; /* Permissions to use when creating remote =
dirs */
> +   long ssh_auth_types;   /* allowed SSH auth types */
> +@@ -1851,6 +1849,8 @@ struct UserDefined {
> +   BIT(http09_allowed); /* allow HTTP/0.9 responses */
> +   BIT(mail_rcpt_allowfails); /* allow RCPT TO command to fail for some
> +                                 recipients */
> ++  unsigned char use_ssl;   /* if AUTH TLS is to be attempted etc, for F=
TP or
> ++                              IMAP or POP3 or others! (type: curl_usess=
l)*/
> + };
> +
> + struct Names {
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27536.patch
> new file mode 100644
> index 0000000000..b04a77de25
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
> @@ -0,0 +1,55 @@
> +From cb49e67303dbafbab1cebf4086e3ec15b7d56ee5 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 10 Mar 2023 09:22:43 +0100
> +Subject: [PATCH] url: only reuse connections with same GSS delegation
> +
> +Reported-by: Harry Sintonen
> +Closes #10731
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/cb49e6730=
3dbafbab1cebf4086e3ec15b7d56ee5]
> +CVE: CVE-2023-27536
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c     | 6 ++++++
> + lib/urldata.h | 1 +
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index f84375c..87f4eb0 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1257,6 +1257,11 @@ ConnectionExists(struct Curl_easy *data,
> +         }
> +       }
> +
> ++      /* GSS delegation differences do not actually affect every connec=
tion
> ++         and auth method, but this check takes precaution before effici=
ency */
> ++      if(needle->gssapi_delegation !=3D check->gssapi_delegation)
> ++      continue;
> ++
> + #ifdef USE_SSH
> +       else if(get_protocol_family(needle->handler->protocol) & PROTO_FA=
MILY_SSH) {
> +         if(!ssh_config_matches(needle, check))
> +@@ -1708,6 +1713,7 @@ static struct connectdata *allocate_conn(struct Cu=
rl_easy *data)
> +   conn->fclosesocket =3D data->set.fclosesocket;
> +   conn->closesocket_client =3D data->set.closesocket_client;
> +   conn->lastused =3D Curl_now(); /* used now */
> ++  conn->gssapi_delegation =3D data->set.gssapi_delegation;
> +
> +   return conn;
> +   error:
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index 51b793b..b8a611b 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1118,6 +1118,7 @@ struct connectdata {
> +                               handle */
> +   BIT(sock_accepted); /* TRUE if the SECONDARYSOCKET was created with
> +                          accept() */
> ++  long gssapi_delegation; /* inherited from set.gssapi_delegation */
> + };
> +
> + /* The end of connectdata. */
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27538.patch
> new file mode 100644
> index 0000000000..5cd11ef88b
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
> @@ -0,0 +1,29 @@
> +Backport of:
> +
> +From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 10 Mar 2023 08:22:51 +0100
> +Subject: [PATCH] url: fix the SSH connection reuse check
> +
> +Reported-by: Harry Sintonen
> +Closes #10735
> +
> +Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/curl/tree/debian/patches/CVE-2023-27538.patch?h=3Dubuntu/foc=
al-security
> +Upstream commit https://github.com/curl/curl/commit/af369db4d3833272b8ed=
443f7fcc2e757a0872eb]
> +CVE: CVE-2023-27538
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1233,7 +1233,7 @@ ConnectionExists(struct Curl_easy *data,
> +         }
> +       }
> +
> +-      if(get_protocol_family(needle->handler->protocol) =3D=3D PROTO_FA=
MILY_SSH) {
> ++      if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_=
SSH) {
> +         if(!ssh_config_matches(needle, check))
> +           continue;
> +       }
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index a7f4f5748f..2e3bcb2c6e 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -44,6 +44,11 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.=
tar.bz2 \
>             file://CVE-2022-43552.patch \
>             file://CVE-2023-23916.patch \
>             file://CVE-2023-27534.patch \
> +           file://CVE-2023-27533.patch \
> +           file://CVE-2023-27538.patch \
> +           file://CVE-2023-27535-pre1.patch \
> +           file://CVE-2023-27535.patch \
> +           file://CVE-2023-27536.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180412): https://lists.openembedded.org/g/openembedde=
d-core/message/180412
> Mute This Topic: https://lists.openembedded.org/mt/98510578/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A942C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 15:04:38 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.21199.1655737471607116938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3iKy6qVs;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id c13so11052336eds.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bKyBo1QtvRBRgptcuSXL8CNROVwVRigAxUqV2+Ho1Hk=;
        b=3iKy6qVsM85U+QYlYQ/Zgn4PG2tdANdLqLbga/g9lfu/5D5T6YfU623d5ZHXWdFSSX
         Inq/ZNKiPcF/KWfy648KvPHWloLKbXTnSVJKarG+8yRAzdUcqMs8ESIVMnRWfsyB1MTe
         5CLkXC0b4PhkDunKptzYmBkcg5KcPvjk9G7+Gx8GIqAmWkLs7sIzygo8Oc06D6VAMdeA
         y+vY78CHyNYySc9yW/qT5HRYeReWQLsVkgOFGo4oxNmlzS8kSKeTQJz77YuUxuwuOUw8
         6501H9Sl3DZkA/KlGZ+NispCTsG82ZHBz4Qz3gg6lLSsma5MulotDNqVkk++mt10NFLs
         ugeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bKyBo1QtvRBRgptcuSXL8CNROVwVRigAxUqV2+Ho1Hk=;
        b=t1TBjB609qUJq6ZBPId3E0o20da+JLILVSLQUSSzsf1+XltSlB2G0jW5v/ijaPhazd
         I5hVTBrkbmcHL/5tQzAHIl3jTS40FKr5ysYbetLBnYezraKHEIb7P4r4QBNdPTxxqtNY
         TWnsv1nHkqdV++PrPZfYG4bCbF0RDpvRpDuk0kM7yes+eLgqTke5N25YVrL5cWVVELoK
         HjigFWumzMtRTM1Y4PpsRta4S4HJU0KmFpLAaiupQroR5SwyN1/Xvq+rd3yrqFtU88NS
         uylkO+754n/QqBeAtfZ+kIeeK7xFgb0mpQn333hkCBFnLQkcjmRgWf9HvT5HK3SJVtw4
         4OAQ==
X-Gm-Message-State: AJIora/DEFm9JW/XLLmOEl1LjKANVcVkiRHrESL+kb5tpxHUIq3Os/5M
	DspS1w6gZOs5JcjOvcdBEoZIQ3kvP0AuBPE/WCgrNw==
X-Google-Smtp-Source: 
 AGRyM1sju7OFYnvRF2sP+68PZUlqIlkkdu0opyJ7LmG1vr7AioQoMbp5DZ0Oc92JK8gfwjpEnrTmETTtcZqnrOQOd2Q=
X-Received: by 2002:a05:6402:698:b0:435:75d9:f94c with SMTP id
 f24-20020a056402069800b0043575d9f94cmr11735269edy.330.1655737470054; Mon, 20
 Jun 2022 08:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220620044411.6397-1-hprajapati@mvista.com>
In-Reply-To: <20220620044411.6397-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Jun 2022 05:04:18 -1000
Message-ID: 
 <CAOSpxdY72m90TxqdygOexUs8Y3cA-f+W0Vv-Otc50-Xbs0-BQA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] cyrus-sasl: CVE-2022-24407 failure to
 properly escape SQL input allows an attacker to execute arbitrary SQL
 commands
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org, jpuhlman@mvista.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 15:04:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167117

This patch appears to be intended for meta-openembedded, not oe-core.

You should resend to: openembedded-devel@lists.openembedded.org

Steve

On Sun, Jun 19, 2022 at 6:44 PM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Source: https://github.com/cyrusimap/cyrus-sasl
> MR: 118501
> Type: Security Fix
> Disposition: Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
> ChangeID: 5e0fc4c28d97b498128e4aa5d3e7c012e914ef51
> Description:
>        CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
>  .../cyrus-sasl/cyrus-sasl_2.1.27.bb           |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
> new file mode 100644
> index 000000000..0ddea03c6
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
> @@ -0,0 +1,83 @@
> +From 906b863c5308567086c6437ce17335b1922a78d1 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Wed, 15 Jun 2022 10:44:50 +0530
> +Subject: [PATCH] CVE-2022-24407
> +
> +Upstream-Status: Backport [https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc]
> +CVE: CVE-2022-24407
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + plugins/sql.c | 26 +++++++++++++++++++++++---
> + 1 file changed, 23 insertions(+), 3 deletions(-)
> +
> +diff --git a/plugins/sql.c b/plugins/sql.c
> +index 95f5f707..5d20759b 100644
> +--- a/plugins/sql.c
> ++++ b/plugins/sql.c
> +@@ -1150,6 +1150,7 @@ static int sql_auxprop_store(void *glob_context,
> +     char *statement = NULL;
> +     char *escap_userid = NULL;
> +     char *escap_realm = NULL;
> ++    char *escap_passwd = NULL;
> +     const char *cmd;
> +
> +     sql_settings_t *settings;
> +@@ -1221,6 +1222,11 @@ static int sql_auxprop_store(void *glob_context,
> +                           "Unable to begin transaction\n");
> +     }
> +     for (cur = to_store; ret == SASL_OK && cur->name; cur++) {
> ++      /* Free the buffer, current content is from previous loop. */
> ++      if (escap_passwd) {
> ++          sparams->utils->free(escap_passwd);
> ++          escap_passwd = NULL;
> ++      }
> +
> +       if (cur->name[0] == '*') {
> +           continue;
> +@@ -1242,19 +1248,32 @@ static int sql_auxprop_store(void *glob_context,
> +       }
> +       sparams->utils->free(statement);
> +
> ++      if (cur->values[0]) {
> ++          escap_passwd = (char *)sparams->utils->malloc(strlen(cur->values[0])*2+1);
> ++          if (!escap_passwd) {
> ++              ret = SASL_NOMEM;
> ++              break;
> ++          }
> ++          settings->sql_engine->sql_escape_str(escap_passwd, cur->values[0]);
> ++      }
> ++
> +       /* create a statement that we will use */
> +       statement = sql_create_statement(cmd, cur->name, escap_userid,
> +                                        escap_realm,
> +-                                       cur->values && cur->values[0] ?
> +-                                       cur->values[0] : SQL_NULL_VALUE,
> ++                                       escap_passwd ?
> ++                                       escap_passwd : SQL_NULL_VALUE,
> +                                        sparams->utils);
> ++      if (!statement) {
> ++          ret = SASL_NOMEM;
> ++          break;
> ++      }
> +
> +       {
> +           char *log_statement =
> +               sql_create_statement(cmd, cur->name,
> +                                    escap_userid,
> +                                    escap_realm,
> +-                                   cur->values && cur->values[0] ?
> ++                                   escap_passwd ?
> +                                    "<omitted>" : SQL_NULL_VALUE,
> +                                    sparams->utils);
> +           sparams->utils->log(sparams->utils->conn, SASL_LOG_DEBUG,
> +@@ -1287,6 +1306,7 @@ static int sql_auxprop_store(void *glob_context,
> +   done:
> +     if (escap_userid) sparams->utils->free(escap_userid);
> +     if (escap_realm) sparams->utils->free(escap_realm);
> ++    if (escap_passwd) sparams->utils->free(escap_passwd);
> +     if (conn) settings->sql_engine->sql_close(conn);
> +     if (userid) sparams->utils->free(userid);
> +     if (realm) sparams->utils->free(realm);
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> index db5f94444..3e7056d67 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=master \
>             file://0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch \
>             file://0001-makeinit.sh-fix-parallel-build-issue.patch \
>             file://CVE-2019-19906.patch \
> +           file://CVE-2022-24407.patch \
>             "
>
>  UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167080): https://lists.openembedded.org/g/openembedded-core/message/167080
> Mute This Topic: https://lists.openembedded.org/mt/91871133/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


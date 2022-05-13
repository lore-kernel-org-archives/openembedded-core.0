Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB91C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 17:59:08 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.626.1652464743548211389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 10:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LjSQ5UUE;
 spf=pass (domain: linaro.org, ip: 209.85.217.52,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f52.google.com with SMTP id b7so4809766vsq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oWfdJjRVKp/q0G13i6DorV3CgdDXswceIbZqYbsRclk=;
        b=LjSQ5UUEyTeax9qqUJlU/o9Uh6Dw7vNZBB6StFMToyBrJdMJXb0WrsGWZECJ9qTZTa
         MfaUQ3mnFP3VRQKOfjhD+jTLqN54PARYWK/xilaW9O725QCACSbCW7AYBjUuJQhkzc/h
         IxoHxNOq6IS4aHPrEEN+rQqukBoDIYu2S4qFkze6wI7yjNNB+ZrEIjZiiq1gvBiWGXV8
         48v+fWnFJ4LKGveDgsifNkj0cn68VGC280ZU4Ey4XvBzqzyQqhS7YxPodK0bVLSRAK/f
         q4N9kmGerytNUSvCO0DHm2U6fQjT/MvyY+ZXB+7r9oKB89dL2KZ3mZrP+GehIGmN2FIR
         DyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oWfdJjRVKp/q0G13i6DorV3CgdDXswceIbZqYbsRclk=;
        b=gCgVFeRhIrHGSZG2Yp3Fzejwytv/5Wd9BuR5ddRf7UdYF7xAEzOfmL8MZjMktAuNWw
         ZBq+mlRuIHqLfZd2OxDdFum5W6IZ5ThoPeTdLTbPBN7sbsWNzI9uQId/ErjhztepxAZ0
         86q+gy8Vy8a9Mm+t21boVN8Xy1RHKKBJ8ZITabdo6zEPj3fvc/FzKKKhg2O4tfE1Aggt
         GgB4Sjyq2Wx1N+TBXKg542v3lWqiHfbHepIutt3Khqew9Xpa2H3tOAvZ+O3LoHHRqRgY
         9H6luMevemQ1ZtzbRUfDhTRY+tBy7sYs68bG43XPbtlYFCMCM2dzhcjR6S2nbWFp5djU
         SLZQ==
X-Gm-Message-State: AOAM533GbBcPUCZcDPQvrZhp/a9Txbo388JGhqo4+58VwABUfRW5pvCs
	lORWkPXoBYJZ6Df3uIHAA1TcpBChvNLxJaF8xcA8Qw==
X-Google-Smtp-Source: 
 ABdhPJzg2+1udLLLQC4SkdLU5OxcpM9j7895z6X+nzD8vSVOnuWLOKKENTZxbW4OFrv0glvxgmoo2WPhXY0TftYTgSw=
X-Received: by 2002:a67:e00f:0:b0:335:8125:5f58 with SMTP id
 c15-20020a67e00f000000b0033581255f58mr1425824vsl.73.1652464742555; Fri, 13
 May 2022 10:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <16E1308820A86BA0.5247@lists.openembedded.org>
In-Reply-To: <16E1308820A86BA0.5247@lists.openembedded.org>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Fri, 13 May 2022 13:58:51 -0400
Message-ID: 
 <CANp-EDbQEeP6Nr6_rErDP6OghF63OREqty0f4ztKZbeHtSrgNw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] cve-check: ensure database is closed on
 error
To: ralph.siemsen@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 17:59:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165584

Ping. Any thoughts on this change?

Regards,
Ralph

On Wed, Mar 30, 2022 at 10:58 AM Ralph Siemsen via
lists.openembedded.org
<ralph.siemsen=linaro.org@lists.openembedded.org> wrote:
>
> In case of an error during download or parse of NVD JSON files, the
> previously opened sqlite3 database should be closed. Also any pending
> transactions should be flushed using conn.commit(). Otherwise there can
> be a "hot journal" left behind, which can cause a subsequent read-only
> connection to fail.
>
> So instead of doing "return" to bail out early, instead "break" out of
> the loop. The existing conn.commit() and conn.close() will be called.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>
> I'm not entirely confident in this, would appreciate a review by folks
> more knowledgeable with python and its sqlite3 binding.
>
> Some further backround information:
> - occasionally the cve-check process fails with a traceback error of
>   "attempt to write a readonly database" (see BZ #14110)
> - the following commit was added to mitigate:
>   440f07d211 cve-check: get_cve_info should open the database read-only
> - but evidently the original error still occurs sometimes
>
> Current speculation is as follows:
> - the database update fails for unrelated reason (network issue)
> - this leaves the connection open, potentially with some updates
>   queued (NVD data is fetched with a separate request for each year)
> - if a subsequent read-only client tries to access the database, it
>   can fail because there is a "hot journal" from the pending
>   not-yet-committed changes, which cannot be processed since the
>   connection is read-only [1]
>
> [1] https://stackoverflow.com/questions/30082008/attempt-to-write-a-readonly-database-but-im-not
>
> Therefore we should ensure to commit() and close() the database
>   connection during NVD update, even when there are errors.
>
>  meta/recipes-core/meta/cve-update-db-native.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index e5822cee58..19863c059d 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -75,7 +75,7 @@ python do_fetch() {
>              except urllib.error.URLError as e:
>                  cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
>                  bb.warn("Failed to fetch CVE data (%s)" % e.reason)
> -                return
> +                break
>
>              if response:
>                  for l in response.read().decode("utf-8").splitlines():
> @@ -85,7 +85,7 @@ python do_fetch() {
>                          break
>                  else:
>                      bb.warn("Cannot parse CVE metadata, update failed")
> -                    return
> +                    break
>
>              # Compare with current db last modified date
>              c.execute("select DATE from META where YEAR = ?", (year,))
> @@ -104,7 +104,7 @@ python do_fetch() {
>                  except urllib.error.URLError as e:
>                      cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
>                      bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
> -                    return
> +                    break
>              else:
>                  bb.debug(2, "Already up to date (last modified %s)" % last_modified)
>              # Update success, set the date to cve_check file.
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163786): https://lists.openembedded.org/g/openembedded-core/message/163786
> Mute This Topic: https://lists.openembedded.org/mt/90133195/3616981
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ralph.siemsen@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>


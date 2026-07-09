Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A579C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:11:00 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5899.1783591859072739055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RulsQJ4J;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f18d92172aso23113146d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783591858; cv=none;
        d=google.com; s=arc-20260327;
        b=b38/VKebXUGnJDaQb8Hp2fNIbI6/Fl+RP5hI4OOKWNnXwqynK/eYcdm1Rs327cabd0
         DCa+X2d/DpyLf+XAa/5Agwg6XcttItTQbsMjI5qOfKE8r8A878iDqzSuFw6nQZ2YZVmp
         CYIEICILCAMARLTd/wV3KDHhUVONxhPevxBRGIU7mH8qG+13UPutWT6J+eJdX49+YKWR
         rhcv4fuuqtwHnY0ZyCDSsS1KROIYNrx0sYrfYETwRWWkxFYnyzUfa3HM0bdXEgFCvesb
         GVIhQcue3yWf8napifjmWTuvYGpW7kbQh48qZ7UedQpQmgpIs/Vx82yNLYTST8om4rVj
         IXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CJ9sxZvBYmxD9UapJqNjxbNAg5NbhWTqmvoDEiMOwWE=;
        fh=cPBSa2bPcOK65+sz6qCMWy/OU7OhGJNaXGJCXkhGLPo=;
        b=bZjuZc5euT+h34q219h/SCm+fdYpal0kfvGp2UVn+MqEbQNvnQWrRCSpVwAhGWrpY1
         xEhoz7mxB/2JCW2eB2mc4gx0gtGYZQZxmuwoYV+1zqO8/jf0ipEXnx2CCVXz34Q58phr
         8oIunduApaTmvDj18P6vibf0ClJLYnqgkNSij0RbqPCmIEiXu1Fx9HToxevH9YXphHPT
         tXc0GtUzaFOxd9ORmBiv6Y+Gfd+bwVFcBZm0nCO55oomRJq1U5sfPrh2jcN1GzHBVEH9
         IWCmA6Aka49/mEZDdMIhMJkB2Cyt6LJzLXRxzCBG2Hewaia4XtcXja89MqMX9pBFjSxt
         1doA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783591858; x=1784196658; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJ9sxZvBYmxD9UapJqNjxbNAg5NbhWTqmvoDEiMOwWE=;
        b=RulsQJ4J2ygGWLH6amePxVnXhia/95LqYwR1KXiXckqmc19qsJio5jrrwQ6STSf0hP
         byTJud0ZnREafvh5UB76862cncqUggv/yE8yKTJiHVQgvakCeleb4GMDlFl/q58Lxg6z
         DXwNphe+n/vyzrNtZRxJG42wapDieFZJKFOnmJl4VQRMLg6k1iPY23rsgzc+qMj4GNes
         t/pdC1o8l5zTzmL9u9Yx9Dbro0lEgCIlWFrSz41OHwwT0qcF1BEP+FDQIEwWbVPIqQuj
         nwMA/jhzon932BHyYaiuxcyWfyAJFOpDLwYXIHrjPOv6F2kAiTdX9aHYPCTUQtWhWtw+
         AGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591858; x=1784196658;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJ9sxZvBYmxD9UapJqNjxbNAg5NbhWTqmvoDEiMOwWE=;
        b=Y/AbfwFYrj4EVBAm/tRgPxILkuICQ7JaY3y+uT5UOK3OFoxvLy+GY1zoRFJ0kz/n1K
         /aJAaY53kjIlQOv/I00Xx3fPmdpGWnS8uxnnq1aNFzMbw6rVhbU2cI5wXPJ2eaDE8R/B
         S5syoriPgsB2TFO5E7bnbhqXLOAU+7UQGBmKwYHs+v+ypufMwFUIuUi8ySJDpHmesBj6
         b8xMBgIlf2IDSG8t8OI5L26erAkaGiXl3JiAAZ8/vtP1iKteNiPBJHvLWGOwt5vjxlbY
         ri3O9sS9hHx8d2MLXZkn5uEreUPwYL5TPP1PCLYAa8oYYuWDdmwzsLjJ2OfgJZzO+KPN
         ddsg==
X-Gm-Message-State: AOJu0YzNQ4mT2lFd9e4A3LWiAFCRyCalG94EcdL1N/uWIRgFOzwtLhmR
	g9eab034H8gvfS6V000paY87KNb/0GcDKQ8LABaZMqRtgSDVYCr3n2oarrEOi0Wu2qfJwvOCpmk
	T9NyFYdyT/m6enx+NPy1PNeQISu80qdO/+Q==
X-Gm-Gg: AfdE7ck34VgcejS+ytMaR2FjWfdqVi0mW7pZrudeNIWQ6BzlQjhAwO13QL0gq9MyuhA
	plnhvm5KfBZfy+H1kKBVcGUuPpQC7s1XtYM4ENz+REzmVPh0k7yU7/lJFGU39ZBAu/gR64rOwhQ
	Kp11yfZHczULW/tdKTm3WBKj6E8D8GmkP0iVnCFFtMkxK8OF3VCKhxKHLRzyPFRKKJG18KkUdHj
	rjNhMRJYALV94QyDqXmshJ5DXP7YlH0HjOd5oJsNrReb18UvPfltnrtbsFhD5L+C6+ufDWYT3K2
	dsqAMFJ2YqwA71rs0W95Cro4KLl56sw=
X-Received: by 2002:ad4:5aea:0:b0:8dd:d13a:8c84 with SMTP id
 6a1803df08f44-8fec03f0092mr68977876d6.8.1783591857348; Thu, 09 Jul 2026
 03:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783457902.git.john.ripple@keysight.com> <20260707211507.2585072-3-john.ripple@keysight.com>
In-Reply-To: <20260707211507.2585072-3-john.ripple@keysight.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jul 2026 12:10:45 +0200
X-Gm-Features: AUfX_mwpLJCH0KzAam3ofTEjhjPSJjbivkNVUmQaPtGTGiY0bSsBKSv9ypZcBvw
Message-ID: <CANNYZj-tgEqdVRKHz+yHrT8RtvouHeEnO9At4tJ5y=cdTz98Gw@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH 3/3] oeqa/utils/metadata: Handle empty git
 repos in git_rev_info
To: john.ripple@keysight.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240574

On Tue, 7 Jul 2026 at 23:15, John Ripple via lists.openembedded.org
<john.ripple=keysight.com@lists.openembedded.org> wrote:
> +    try:
> +        info['commit'] = repo.head.commit.hexsha
> +        info['commit_count'] = repo.head.commit.count()
> +        info['commit_time'] = repo.head.commit.committed_date
> +    except (ValueError, TypeError):
> +        pass

Suppressing generic exceptions like this to avoid a specific problem
is problematic, as it can quietly suppress different, real problems.
I'd say any layers handled by this function must have a commit, and if
they don't it's a user error. How did this come up?

Alex


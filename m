Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC69FC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 11:35:33 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10339.1788348927547619864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bZBsoWkn;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90e7fd978beso14066786d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788348926; cv=none;
        d=google.com; s=arc-20260327;
        b=rDnvngs+LWjlBrMXooTyIndxQ+JSClBp553gI3Ype/KRShTxQon9Hyd4jb1FVItZsV
         7frCeTKuIQFODmZqiQImzI/GQisZr3Qi8L8PYehMUipuuCAJJOXx6552UyfvwP4Za4a5
         DTbT56tqDV8Rh3v70pDK/JSc7RBSRvOLNWGIlCtvy1azOk4m5eGej5HnvT7YEISmaxcM
         DDv4hITxKFE14Q0xcocHDtnf9AlfssIDDN2xKQfeffa5fGW7tdDvKbcDlX+BdZ2/rkb0
         R1x3htmMltDyHS7D83vvjQWpDfp+sb8x5Ayf/7i3qex8v+ICQ1OoyyS73WrurHo7LLgt
         lJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0WwWKrDFQEGgvGtrpJkMYvhCsjzIAl4DTKAEDt38NS4=;
        fh=0VXH+9Ni9qvjsA5kDm4Ny2JKO2JT9O9GK14uyM/A078=;
        b=hw2I7Sz8cTfSQKGtNe41P4k+3HRHvrt5U5ieRio/yAHNj3YFwKA7jt4aslx/wJDXSK
         U9LBgv/Oh9B+Ryz43Tif1EeAlgWrATOZgOjuA0HKDro87RXTjXQalVZ2AJuWI3i5MMlw
         aAHYruogxEMqxP+RUirHmffbNpTbGQNvXPusuQjszZxcj1tCrSlIJ1Y4uOQduQBOOGNC
         LVPS5othJruXw8icdffdYoLtzARl7YuWrwQuuxmLSoBv2b1Qx8X2eKFGEr8Da6a94F3Y
         rC28BWnFUZVedJbXbkBkoEClqpg+VYECVFC/AVxUsoKDfNo37RzLvDiP92T/hQ45YkkR
         cKpQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348926; x=1788953726; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WwWKrDFQEGgvGtrpJkMYvhCsjzIAl4DTKAEDt38NS4=;
        b=bZBsoWknZRlzkhLryZiy7n6dWZDo6AKUkgM1g86/KYtawrNMg2KLeEj1c/HmXQXCFS
         9ysDmF8540KYTPEhXq1hgSUvBaG1NpR6NGQ/3Gy+1oC9xi14PCRcwWOEW6hl01WOv3nH
         yZNeDxSMNgyuME2eYKSpKBAnUpP8xwANdmhEtPeEHyF7zJuLVGxOUFRccZ5bL08Wohqk
         J0Pn9WEkDEukHo2FgE+B/Mn+Qc07AthJxPw6ObkE4bt1AIB6qD0eKXzIhPWyDiq5TI/H
         5WoMGbXEgfACRcwr8fLVSfxIts5upyp1pd67UJwy5CUa/gHhvgVlXdTyeKoM8XVein7P
         W3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348926; x=1788953726;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WwWKrDFQEGgvGtrpJkMYvhCsjzIAl4DTKAEDt38NS4=;
        b=OlYfD6wNK5exe0OiFCzX0nDDsSaP3uwed/bRc5W21lMu3sk1piwCWam2+1wDnoQPBd
         NPjB3K5Xz9sK+zNg5x1SOu6istl+3Bsx3/ikO/C+RrFNwuP7fMf5jldhGMT+2B44Za1A
         R+rFNjQs97nGvVfHaY18jJNkKMgmAr8+3KzOdE0J11z40cl0sTB4Zr9DH/2qKafsM5vJ
         vVA7FnQEuqb0daButd75i9WlkAFki2A//HZ+T+WQh1pIoUbSPbYJk5SZDHO6xKjMYvS+
         Rq0lNWVYVVw7ah1JsuI+VhNZ3OW7ZFpqhFnBiQkXV4Mz+4z7fNDrIpdgvhp7AXQyZRl9
         6JDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtFRqBzllzRoR/v9vK3gsU9rWINIQ2YKM9FHOLiONMbQ7W5u6oNbNmyjbtGme6OpdoYVWpRvIjD/n8JK6YAcLxRg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nYay7idIGLAFYqy2HUl4TULcA/viGpfeKA3iLYDtV+tJspdAUY
	qJqxalMcQvH67uAgw6rMGTzb5UsXhGg13nqzAI1i2pGkSHY0ptQIGpEcEDikS+/F10PD2rSImbL
	EvoaQGknWMYO7IJqSa/TiNoMTClX35aY=
X-Gm-Gg: AR+sD12RJ3yjVlwIW/DuogllljJuOmzbqL+REI/xzQiadsI6UzDGzBKPl0Rk4USMW1R
	quCVTZQxtfL307ieRIYhX673MNhoCARCU7y0kHA04QAecXqb4MK3A9Dz47dXJqsTEcniJmU1fOX
	koX3ODnH7o6nqUxs6nQm1Kdj4E7tGVoqpcx9sgKXmAjpB95CLD21X71hBZluOLUULcBgPyOYK4L
	ieHgYrQ/V2fagBkrlsNx27geJkP/s3T7u4HfSWEinPqS5kG+bmWfZLUh/03UbIBj6d7ppHrpZDj
	8czIlR6z8qg+qluWH1OUUaILczHJK/EqNMIR46sOzPrcgiHBlNUe3ct+wnCMq6UlvOUePCyV9rH
	pF/bMvG9Z9XK/lA==
X-Received: by 2002:a05:6214:3f85:b0:90e:9d7c:e622 with SMTP id
 6a1803df08f44-90eca377bafmr56823296d6.17.1788348926415; Wed, 02 Sep 2026
 04:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
 <20260825013312.2695028-15-sumanth.gavini@windriver.com> <4ce16bd69cc20976fb4ad6acdbff943d311ecf39.camel@linuxfoundation.org>
In-Reply-To: <4ce16bd69cc20976fb4ad6acdbff943d311ecf39.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Sep 2026 13:35:14 +0200
X-Gm-Features: AcwNN1Wl-y3zPecNospnnZyCNX75KkC1JUfQYxOVfb_Ve6anmkwYAEINO3MHCXc
Message-ID: <CANNYZj-xNmrBCf0sJ1u_s5Y9o305B6FrefEP9WfMhb7G1fyF4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v17 14/14] lib/oe/package_manager/rpm: handle
 RPM 6 non-zero exit on %post failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, mattware@cisco.com, esparlin@cisco.com, 
	peter.marko@siemens.com, randy.macleod@windriver.com, 
	"adam.duskett" <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 11:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244931

On Tue, 25 Aug 2026 at 08:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > RPM 6.0 intentionally changed rpmtsRun() to return -1 whenever any
> > scriptlet fails, even non-critical ones like %post where warn_only=True
> > (upstream RPM PR#3819, lib/transaction.cc).
> >
> > Root cause - two changes in RPM 6 lib/transaction.cc vs RPM 4:
> >
> >   1. New field set before warn_only resets rc (transaction.cc:1754):
> >        ts->scriptError = 1;
> >
> >   2. Final exit now ORs in the new flag (transaction.cc:1910):
> >        RPM 4: rc = nfailed ? -1 : 0;
> >        RPM 6: rc = (nfailed || ts->scriptError) ? -1 : 0;
> >
> > Call chain for a failing %post in RPM 4 (exits 0):
> >   runScript()        warn_only=1 -> rc reset to RPMRC_OK
> >   psm.c:896          if (rc) break -> NOT taken, install continues
> >   rpmte.c:823        if (failed) -> NOT taken, rpmteMarkFailed() skipped
> >   transaction.c:1652 if (failed) -> NOT taken, nfailed stays 0
> >   transaction.c:1896 rc = nfailed ? -1 : 0 -> rc=0
> >   Python ts.run()    returns None -> DNF exits 0
> >
> > Call chain for a failing %post in RPM 6 (exits 1):
> >   runScript()         ts->scriptError=1, then rc reset to RPMRC_OK
> >   psm.c:896           if (rc) break -> NOT taken (rc still 0)
> >   rpmte.c:823         if (failed) -> NOT taken (same as RPM 4)
> >   transaction.cc:1652 if (failed) -> NOT taken, nfailed stays 0
> >   transaction.cc:1910 rc = (nfailed || ts->scriptError) ? -1 : 0 -> rc=-1
> >   Python ts.run()     returns [] -> DNF raises "Could not run
> > transaction."
> >                       -> DNF exits 1
> >
> > In both RPM versions, RPMCALLBACK_SCRIPT_ERROR fires and DNF's
> > _scriptError() (dnf/yum/rpmtrans.py:407-418) prints:
> >   "Error in POSTIN scriptlet in rpm package <name>"
> >
> > OE's install_pkgs() already scans for this line and calls
> > failed_postinsts_abort() (package_manager/rpm/__init__.py:210-219).
> > With RPM 4 this path is always reached because DNF exits 0. With RPM 6
> > the CalledProcessError raised by DNF's non-zero exit intercepts
> > execution
> > in _invoke_dnf() before the scan runs.
> >
> > DNF 4 (lib/dnf/base.py:1146-1158) was never updated for this RPM 6
> > behaviour. When ts.run() returns [] with no failed elements it
> > unconditionally raises "Could not run transaction." - the comment at
> > base.py:1147 still describes RPM 4 semantics where this case meant a
> > global error such as a transaction lock failure. There is an open DNF5
> > issue (#2507) but no fix in DNF 4.
> >
> > Fix: detect "Error in POSTIN scriptlet in rpm package" in the DNF output
> > inside _invoke_dnf()'s CalledProcessError handler and return the output
> > instead of calling bb.fatal(), allowing install_pkgs()'s existing
> > scriptlet scan to run as it did with RPM 4.
> >
> > Tested with oe-selftest runtime_test.Postinst.test_failing_postinst:
> >   rpm 4.20.x: PASSED - DNF exits 0, scan path exercised as expected
> >   rpm 6.0.x without fix: FAILED - CalledProcessError before scan reached
> >   rpm 6.0.x with fix: PASSED - scan path restored, bb.fatal() fires
> >
> > References:
> > https://github.com/rpm-software-management/rpm/pull/3819
> >
> > Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> > ---
> >  meta/lib/oe/package_manager/rpm/__init__.py | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
> > index cd6efe3d3b..ccb4316bd0 100644
> > --- a/meta/lib/oe/package_manager/rpm/__init__.py
> > +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> > @@ -333,6 +333,13 @@ class RpmPM(PackageManager):
> >          except subprocess.CalledProcessError as e:
> >              if print_output:
> >                  e_output = e.output.decode("utf-8")
> > +                # RPM 6 fails the entire transaction when a %post scriptlet
> > +                # fails, causing dnf to exit non-zero. Let install_pkgs handle
> > +                # scriptlet failures via its existing "Error in POSTIN scriptlet"
> > +                # scanning rather than treating this as a fatal dnf invocation error.
> > +                if "Error in POSTIN scriptlet in rpm package" in e_output:
> > +                    bb.note(e_output)
> > +                    return e_output
> >                  extra_info = ""
> >                  if "install" in dnf_args:
> >                      if "Error: Unable to find a match:" in e_output:
>
> If the transaction fails, isn't that a problem? Wouldn't there be other
> issues after this if we rely on this command having succeeded?
>
> Copying Adam as I know he ran into this with dnf5 as well...

I think a better fix is to not suppress the exception and rely on the
line being looked for somewhere else in the code tree, but rather
handle the exception in the function caller, and look for needed line
there, e.g. move the check for the line to the exception handler.

Alex


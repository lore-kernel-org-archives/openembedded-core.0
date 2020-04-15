Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.11939.1586946724549615762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 03:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWfTgyaH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id a201so17979433wme.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KiAwGQcCmEvOgNi+5Eyb0SkiEn8YrFIxBJSEnDyIf8I=;
        b=bWfTgyaHNTPkKkoFhKLD9f8yOacHagPZj4M4MKIygFXoXL6HUto6Lcl2rW/tmNv5xp
         9m218ys3GzUvlzdaeG0wm+IXV4ShRfe1slPo060+lEgx7zWt/Ok8GgA7OWOAmNIKdpMN
         N/jkbgOFYbuftCn4IWfqpCkNvXkyFBfHLybCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KiAwGQcCmEvOgNi+5Eyb0SkiEn8YrFIxBJSEnDyIf8I=;
        b=XmHjpUxXdz7CFGUNeAEtRQ8WFkO2l7yKQ0voED+9jkkum8OhtoUgfFXso1WVepGMQn
         ad550i6YmngDcbrPPyKJKp2nVh74dyg/wIrKfAd4sk94A9tVjZ4KlM7p+yOX+gHeE19E
         D+RhXoXyTSKSYH7PN2g7g6JI2LjNYYNNcgQ8wgM5rCOpoL5RcYWxNv3ciKgXeqHi23lg
         MeFuJY5lcHz0ZKOUxz7xfdy4NEI7KPqEWyc1TtAsZ3PmTs2MQWOj6EeQBZOUyB+CTpuI
         eUr7cy4gIKDv5pIKgG2IoHD96s9unH+G939QtLlqSMFxEi9zM67v7FMBrZ9Tuwhu8qHo
         3cnw==
X-Gm-Message-State: AGi0PuYSlbcFBKTnqloN89jAthasuOVh4pblBh+6Y5WIFmrw2jWVAIJa
	os/xHMkbICuAm0O1XZbU6/1D/w==
X-Google-Smtp-Source: APiQypLU6xCyhk37MzgwKuf4y73h0BP3J7IPQbqllE6dsQlBPba1fNXI0WoG5g/lSOxZND49Ne9jAQ==
X-Received: by 2002:a05:600c:4112:: with SMTP id j18mr4485324wmi.69.1586946722938;
        Wed, 15 Apr 2020 03:32:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j124sm22063074wmb.25.2020.04.15.03.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 03:32:02 -0700 (PDT)
Message-ID: <2ee5d8832f691c36c00fcdb31609fff3648e2673.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 2/2] image.bbclass: deploy image artifacts in stages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
 Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Bartosz Golaszewski
	 <bgolaszewski@baylibre.com>
Date: Wed, 15 Apr 2020 11:32:00 +0100
In-Reply-To: <CAMRc=MdmrCSUYJXu7nhipPLLJFa6qdzD0E8Zq3S38mZKANpLUg@mail.gmail.com>
References: <20200406170229.25363-1-brgl@bgdev.pl>
	 <20200406170229.25363-3-brgl@bgdev.pl>
	 <CAMRc=MdmrCSUYJXu7nhipPLLJFa6qdzD0E8Zq3S38mZKANpLUg@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-04-15 at 12:20 +0200, Bartosz Golaszewski wrote:
> pon., 6 kwi 2020 o 19:02 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> > override. This way each generated set of artifacts is deployed as soon
> > as it's ready instead of the do_image_complete task handling the entire
> > deployement. This allows us to better fine-tune dependencies e.g. we
> > can make do_image_wic depend on fitImage task which can in turn depend
> > on do_image_ext4.
> > 
> > We need delete the IMGDEPLOYDIR variable from the data object passed
> > to each image task so that it gets expanded with the correct override.
> > 
> > In order to make sure that tasks added to SSTATETASKS in anonymous python
> > functions are correctly setup, move the code that assigns pre- and
> > postfuncs to an event handler invoked on bb.event.RecipeTaskPreProcess
> > in sstate.bbclass. This event is fired right after the anonymous
> > functions.
> > 
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  meta/classes/image.bbclass  | 17 +++++++++++++++++
> >  meta/classes/sstate.bbclass |  4 ++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 07aa1f1fa5..ffd63aa82a 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -428,10 +428,12 @@ python () {
> >          # date/time values. It will get expanded at execution time.
> >          # Similarly TMPDIR since otherwise we see QA stamp comparision problems
> >          # Expand PV else it can trigger get_srcrev which can fail due to these variables being unset
> > +        # Delete IMGDEPLOYDIR so that each task gets its own, overriden value
> >          localdata.setVar('PV', d.getVar('PV'))
> >          localdata.delVar('DATETIME')
> >          localdata.delVar('DATE')
> >          localdata.delVar('TMPDIR')
> > +        localdata.delVar('IMGDEPLOYDIR')
> >          vardepsexclude = (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepsexclude', True) or '').split()
> >          for dep in vardepsexclude:
> >              localdata.delVar(dep)
> > @@ -502,6 +504,21 @@ python () {
> > 
> >          bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
> >          bb.build.addtask(task, 'do_image_complete', after, d)
> > +
> > +        imgdeploydir = d.getVar('IMGDEPLOYDIR')
> > +        task_override = task[3:].replace('_', '-') # 'do_image_ext4' becomes 'image-ext4'
> > +        taskdeploydir = '{}/deploy-{}-{}'.format(os.path.dirname(imgdeploydir),
> > +                                                 d.getVar('PN'), task_override)
> > +
> > +        # Each image task gets its own IMGDEPLOYDIR directory and is added to
> > +        # SSTATETASKS. This way every set of artifacts gets deployed right after
> > +        # the do_image_foo task completes.
> > +        d.setVar('IMGDEPLOYDIR_task-{}'.format(task_override), taskdeploydir)
> > +        d.appendVar('SSTATETASKS', ' {}'.format(task))
> > +        d.setVarFlag(task, 'sstate-inputdirs', taskdeploydir)
> > +        d.setVarFlag(task, 'sstate-outputdirs', d.getVar('DEPLOY_DIR_IMAGE'))
> > +        d.setVarFlag(task, 'cleandirs', taskdeploydir)
> > +        d.setVar('SSTATE_SKIP_CREATION_task-{}'.format(task_override), '1')
> >  }
> > 
> >  #
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index c73c3b42a7..3c71312010 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -138,13 +138,17 @@ python () {
> >          d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
> >          d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}")
> >          d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
> > +}
> > 
> > +python sstate_setup_tasks() {
> >      unique_tasks = sorted(set((d.getVar('SSTATETASKS') or "").split()))
> >      d.setVar('SSTATETASKS', " ".join(unique_tasks))
> >      for task in unique_tasks:
> >          d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
> >          d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
> >  }
> > +addhandler sstate_setup_tasks
> > +sstate_setup_tasks[eventmask] = "bb.event.RecipeTaskPreProcess"
> > 
> >  def sstate_init(task, d):
> >      ss = {}
> > --
> > 2.25.0
> > 
> 
> Gentle ping.

Gentle reminder that we're in the middle of sorting out a release. This
will not merge until after the release and I don't have the cycles for
review of this kind of change right now.

FWIW I still don't like the way this integrates into sstate and I want
to spend some time trying to find a better way. I don't have any
constructive suggestion as to what that would look like so I haven't
replied, I simply don't know and that isn't a useful answer to you.

You've also ignored my request to follow the coding style used in the 
rest of the class code :(.

Cheers,

Richard


Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD47FC761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 12:55:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24181.1680180893752819710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 05:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BX9JPkFj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C29181BF207;
	Thu, 30 Mar 2023 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680180891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKenD7rA8UbXrDzl/rygPDfBxnZPQ4t/Fx83MqFliAg=;
	b=BX9JPkFj2zd8OjjzaWMDdFxB0JSUA7I1F0iGCpFIeqW9KrktsMx9NONA2XslW5dYcr9vJJ
	clGrgAdyVbxFEW6nxIDvfGzOapCaqB9TRVeEpTZsNWVtMF2uEyofQft/YTP7LsCrXm+Vwf
	vYYX8NJY6GDEyNCRgBBcuw7BQz9ERexU4CUP1hj49V27+ygqeOpNJkSxT/zHwoxX988bw7
	J/5Rma4uXeLWq9H/KmY0c/+EIjKOV7prWZDeGNUITP8Av37bU8ZMgwQQOip0biQqABYQVr
	AJ+51QnQ2gYDtefGaGPmABZk8dJV1P5z8RfCasApFmxQCG5ZPCZ1DoDmd/1XXA==
Date: Thu, 30 Mar 2023 14:54:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tobias Hagelborn <tobias.hagelborn@axis.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
Message-ID: <202303301254507aff37b1@mail.local>
References: <20230323100847.3740485-1-tobiasha@axis.com>
 <1751049D3A378E36.12651@lists.openembedded.org>
 <208af449dd70c4d88af9e9259413c823d83e0302.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <208af449dd70c4d88af9e9259413c823d83e0302.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 12:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179319

On 30/03/2023 10:10:21+0100, Richard Purdie wrote:
> On Wed, 2023-03-29 at 23:33 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2023-03-23 at 11:08 +0100, Tobias Hagelborn wrote:
> > > Move the signature file into place only after it is successfully signed.
> > > This to avoid race and corrupted .sig files in cases multiple onging
> > > builds write to a shared sstate-cache dir.
> > > 
> > > Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
> > > ---
> > >  meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------
> > >  1 file changed, 15 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> > > index 613dab8561..868846cdc5 100644
> > > --- a/meta/lib/oe/gpg_sign.py
> > > +++ b/meta/lib/oe/gpg_sign.py
> > > @@ -5,11 +5,12 @@
> > >  #
> > >  
> > >  """Helper module for GPG signing"""
> > > -import os
> > >  
> > >  import bb
> > > -import subprocess
> > > +import os
> > >  import shlex
> > > +import subprocess
> > > +import tempfile
> > >  
> > >  class LocalSigner(object):
> > >      """Class for handling local (on the build host) signing"""
> > > @@ -73,8 +74,6 @@ class LocalSigner(object):
> > >              cmd += ['--homedir', self.gpg_path]
> > >          if armor:
> > >              cmd += ['--armor']
> > > -        if output_suffix:
> > > -            cmd += ['-o', input_file + "." + output_suffix]
> > >          if use_sha256:
> > >              cmd += ['--digest-algo', "SHA256"]
> > >  
> > > @@ -83,19 +82,25 @@ class LocalSigner(object):
> > >          if self.gpg_version > (2,1,):
> > >              cmd += ['--pinentry-mode', 'loopback']
> > >  
> > > -        cmd += [input_file]
> > > -
> > >          try:
> > >              if passphrase_file:
> > >                  with open(passphrase_file) as fobj:
> > >                      passphrase = fobj.readline();
> > >  
> > > -            job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
> > > -            (_, stderr) = job.communicate(passphrase.encode("utf-8"))
> > > +            output_file = input_file + "." + (output_suffix or 'sig')
> > 
> > This doesn't match the behaviour of output_suffix as used above where
> > it defaults to None. This forces it to a default of "sig" instead?
> > 
> > If that intentional that should be in the commit message.
> > 
> > 
> > > +            with tempfile.TemporaryDirectory(dir=os.path.dirname(output_file)) as tmp_dir:
> > > +                tmp_file = os.path.join(tmp_dir, os.path.basename(output_file))
> > > +                cmd += ['-o', tmp_file]
> > > +
> > > +                cmd += [input_file]
> > > +
> > > +                job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
> > > +                (_, stderr) = job.communicate(passphrase.encode("utf-8"))
> > >  
> > > -            if job.returncode:
> > > -                bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
> > > +                if job.returncode:
> > > +                    bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
> > >  
> > > +                os.rename(tmp_file, output_file)
> > >          except IOError as e:
> > >              bb.error("IO error (%s): %s" % (e.errno, e.strerror))
> > >              raise Exception("Failed to sign '%s'" % input_file)
> 
> I've been struggling to confirm it but have now done so. This does
> cause an oe-selftest failure as here:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4950/steps/14/logs/stdio
> 
> 
> i.e. from
> 
> oe-selftest -r runtime_test.TestImage.test_testimage_dnf
> 

I realize just now that I forgot to send an email telling exactly that,
sorry!

> Cheers,
> 
> Richard
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179308): https://lists.openembedded.org/g/openembedded-core/message/179308
> Mute This Topic: https://lists.openembedded.org/mt/97797700/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


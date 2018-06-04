Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF7D607AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 18:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 42B109C1AB7;
	Mon,  4 Jun 2018 14:15:46 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 0Ely6GYTJD3u; Mon,  4 Jun 2018 14:15:45 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B48D59C3466;
	Mon,  4 Jun 2018 14:15:45 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id rw5Eda3bBeqj; Mon,  4 Jun 2018 14:15:45 -0400 (EDT)
Received: from workotop.localdomain (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 91C279C1AB7;
	Mon,  4 Jun 2018 14:15:45 -0400 (EDT)
Date: Mon, 4 Jun 2018 14:15:41 -0400
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180604181541.qar66nffop2ejyqu@workotop.localdomain>
References: <20180604153827.5186-1-damien.riegel@savoirfairelinux.com>
	<8d58855729cdcd56b30d8550c529e12595c39be8.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <8d58855729cdcd56b30d8550c529e12595c39be8.camel@linuxfoundation.org>
User-Agent: NeoMutt/20180512
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_ext.bbclass: fix corebase identification
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jun 2018 18:15:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 04, 2018 at 04:54:08PM +0100, Richard Purdie wrote:
> On Mon, 2018-06-04 at 11:38 -0400, Damien Riegel wrote:
> > When generating the extended SDK, there is a copy step where this
> > class
> > goes through the layers and other stuff that have been copied to
> > generate the SDK.
> > 
> > The corebase; ie. the folder that contains the core layer 'meta' is
> > treated in a special way. Unfortunately in our tree, we have:
> > 
> >   layers/meta/meta
> >            |     `- core layer
> >            `------- corebase
> > 
> > When populate_sdk_ext checks this layer, it thinks wrongly that it's
> > the
> > corebase folder, so it treats it differently and doesn't add it to
> > the
> > layer list. When bitbake tries to run in the generated SDK, it will
> > fail
> > because it doesn't find information stored in that layer.
> > 
> > This patch makes sure only the corebase folder is identified as so.
> > 
> > Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> > ---
> >  meta/classes/populate_sdk_ext.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/populate_sdk_ext.bbclass
> > b/meta/classes/populate_sdk_ext.bbclass
> > index 2dd21237e2..917fbfa1b4 100644
> > --- a/meta/classes/populate_sdk_ext.bbclass
> > +++ b/meta/classes/populate_sdk_ext.bbclass
> > @@ -207,7 +207,7 @@ python copy_buildsystem () {
> >      sdkbblayers = []
> >      corebase = os.path.basename(d.getVar('COREBASE'))
> >      for layer in layers_copied:
> > -        if corebase == os.path.basename(layer):
> > +        if corebase == layer:
> >              conf_bbpath = os.path.join('layers', layer, 'bitbake')
> > 
> 
> Whilst I appreciate the problem, the fix doesn't look like it would
> work for other use cases since its comparing a basename on one side and
> a non-basename on the other...

Well, the issue is precisely caused by the comparison of basenames.

    >>> os.path.basename("meta/meta")
    'meta'
    >>> os.path.basename("meta")
    'meta'

So it doesn't differentiate between a layer within corebase and corebase
itself. copy_bitbake_and_layers seems to do the comparison differently
[1]. Arguably there, it's comparison between absolute paths, but still.

Do you have suggestions on how I could fix this bug otherwise? Maybe
copy_bitbake_and_layers could return a tuple (corebase, layers) instead
of a list that contains copied_layers + corebase.

[1] https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe/copy_buildsystem.py#L91

Thank for the feedback,
-- 
Damien


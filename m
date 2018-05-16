Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E1A5A746FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 09:57:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so211904wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FvIQrJcbCi2UFhgcdWdipgta/nPOmHSZdZOAoDB3NPs=;
	b=n0nMDDp9Wa0uifoRzSqEzhQSMiAhYp1WQFEJUuSxA+8nr78RSVuA3yUzJTfEqVbDAo
	c8vmVlJNlrRBpUw10dXV0I5uT99vtS9c+QA7fOnw/2I83o+LcdwP//HRCF/jBAOC9+Ad
	VhvXQTHU15XxfkvlfkAIcWa4Yl0q/CUVtdPeAPhz+AGmhZs7hx4xP9jMC8OTbOkfUW/t
	hZaJqhZLBuoyjY60+m9SzMh85qgEOGaPK2t0Mewc8gUQRqs5I0HdMT/o4UV+VvDH6/5m
	2vNSGYyjDdFKS+9HIm6xkvVgWvKUfqkR0s5HRKGLtg2+uF73IKj7cDvOle2rW8ry2eH7
	qBtA==
X-Gm-Message-State: ALKqPwepPgBjrAHzXd5Fs50NG+L5WRmqcjqOe4aLsl2U7U3byM5VeifV
	mq30jQXETr3gKD0kM2LtdyrwdmnO
X-Google-Smtp-Source: AB8JxZpDBfZJYIp2SdgdW39CHaaQqmG/tpzUjWRX8vUJ0BBTxeFBRUzOmcjIFkQ91WPxSEN3CEKvtQ==
X-Received: by 2002:a50:8bbd:: with SMTP id
	m58-v6mr201368edm.165.1526464679941; 
	Wed, 16 May 2018 02:57:59 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	r15-v6sm1132486edq.40.2018.05.16.02.57.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 02:57:58 -0700 (PDT)
Message-ID: <1526464678.32156.14.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2018 10:57:58 +0100
In-Reply-To: <1525939504.5115.18.camel@andred.net>
References: <20180309130000.1937-1-git@andred.net>
	<20180321163130.23765-1-git@andred.net>
	<1525939504.5115.18.camel@andred.net>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Wed, 16 May 2018 09:58:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Is there anything wrong with this?

On Thu, 2018-05-10 at 09:05 +0100, André Draszik wrote:
> ping
> 
> On Wed, 2018-03-21 at 16:31 +0000, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > The testdata.json is being written to DEPLOY_DIR_IMAGE directly,
> > thus bypassing sstate, which results in an ever growing list
> > of files.
> > 
> > Write them to IMGDEPLOYDIR instead, so as to benefit from the
> > automatic management via sstate.
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > 
> > ---
> > v2: fix typo in subject line
> > ---
> >  meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/classes/rootfs-postcommands.bbclass
> > b/meta/classes/rootfs-postcommands.bbclass
> > index a4e627fef8..01eee350b8 100644
> > --- a/meta/classes/rootfs-postcommands.bbclass
> > +++ b/meta/classes/rootfs-postcommands.bbclass
> > @@ -303,17 +303,18 @@ rootfs_sysroot_relativelinks () {
> >  python write_image_test_data() {
> >      from oe.data import export2json
> >  
> > -    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'),
> > d.getVar('IMAGE_NAME'))
> > -    testdata_link = "%s/%s.testdata.json" %
> > (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
> > +    deploy_dir = d.getVar('IMGDEPLOYDIR')
> > +    link_name = d.getVar('IMAGE_LINK_NAME')
> > +    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" %
> > d.getVar('IMAGE_NAME'))
> >  
> > -    bb.utils.mkdirhier(os.path.dirname(testdata))
> >      searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
> > -    export2json(d, testdata,searchString=searchString,replaceString="")
> > +    export2json(d, testdata_name, searchString=searchString,
> > replaceString="")
> >  
> > -    if testdata_link != testdata:
> > +    if os.path.exists(testdata_name):
> > +        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" %
> > link_name)
> >          if os.path.lexists(testdata_link):
> > -           os.remove(testdata_link)
> > -        os.symlink(os.path.basename(testdata), testdata_link)
> > +            os.remove(testdata_link)
> > +        os.symlink(os.path.basename(testdata_name), testdata_link)
> >  }
> >  write_image_test_data[vardepsexclude] += "TOPDIR"
> >  


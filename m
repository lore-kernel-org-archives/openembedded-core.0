Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D1CE079550
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:01:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8JG1bqH012061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 19 Sep 2018 17:01:41 +0100
Message-ID: <ed51b3579be101e9d2f711ef9f94d16029981f92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 09:01:36 -0700
In-Reply-To: <20180919171113.21fecc56@t460p>
References: <20180919064135.30249-1-urs.fassler@bbv.ch>
	<20180919171113.21fecc56@t460p>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] openssh: resolve install conflict with openssh-sftp-server-dev
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
X-List-Received-Date: Wed, 19 Sep 2018 16:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-09-19 at 17:11 +0200, Andreas Oberritter wrote:
> On Wed, 19 Sep 2018 08:41:35 +0200
> Urs Fässler <urs.fassler@bbv.ch> wrote:
> 
> > Image generation fails with the configuration:
> >   EXTRA_IMAGE_FEATURES = "ssh-server-dropbear eclipse-debug dev-
> > pkgs"
> > This is due the dependency eclipse-debug -> openssh-sftp-server ->
> > openssh-dev -> openssh. openssh can not be installed since it
> > conflicts
> > with dropbear.
> 
> That's odd. Why does openssh-sftp-server depend on openssh-dev? Does
> openssh-dev contain a file which it shouldn't, e.g. a dynamically
> loaded module/plug-in?

It doesn't, its the fact that "dev-pkgs" are requested in
IMAGE_FEATURES. "openssh-dev" would be the default for openssh packages
and dropbear-dev would be the default for dropbear packages. 

The patch here doesn't sound correct. I'm wondering if the correct fix
is for ${PN}-dev should not depend on ${PN} and whether that would fix
the problem?

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2A9745AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:36:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w55Aa5oK026980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 5 Jun 2018 11:36:06 +0100
Message-ID: <355d4f0ef965769e2baf353abaf35ab730fc6863.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Martin Kelly
	<mkelly@xevo.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jun 2018 11:36:05 +0100
In-Reply-To: <e9d0cb69fa974fc38eaa460a1d06d88a@XBOX02.axis.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
	<20180604230602.8461-3-mkelly@xevo.com>
	<e9d0cb69fa974fc38eaa460a1d06d88a@XBOX02.axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3 2/6] toolchain-scripts: allow non-sh	post-relocate
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
X-List-Received-Date: Tue, 05 Jun 2018 10:36:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-05 at 10:27 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Martin Kelly
> > Sent: den 5 juni 2018 01:06
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v3 2/6] toolchain-scripts: allow non-sh
> > post-
> > relocate
> > 
> > Currently, we look only for scripts matching *.sh, which means we
> > can't
> > write post-relocate scripts in other languages.
> > 
> > Expand this to allow any type of script.
> > 
> > Signed-off-by: Martin Kelly <mkelly@xevo.com>
> > ---
> > v3:
> > - Test for executability prior to running each script.
> > 
> >  meta/classes/toolchain-scripts.bbclass | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/toolchain-scripts.bbclass
> > b/meta/classes/toolchain-scripts.bbclass
> > index a72436167c..da8a57f24b 100644
> > --- a/meta/classes/toolchain-scripts.bbclass
> > +++ b/meta/classes/toolchain-scripts.bbclass
> > @@ -124,7 +124,10 @@ toolchain_create_post_relocate_script() {
> > 
> >  	cat >> $script <<EOF
> >  if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
> > -    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
> > +    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
> > +        if [ ! -x \$s ]; then
> > +            continue
> > +        fi
> 
> That can be written as:
> 
>          [ -x \$s ] || continue
> 
> >          \$s "\$1"
> 
> Or you can replace all of it with:
> 
>          [ ! -x \$s ] || \$s "\$1"
> 
> You should not invert the test and replace the || with && though 
> (even if it may seem more logical) due to the return status of 
> the [ command in case $s is not executable.

FWIW personally I prefer the original patch version as being more
readable...

Cheers,

Richard


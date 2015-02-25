Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1E5736E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 15:18:05 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z20so6481310igj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 07:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=pXxvSTtwIwN8zPKNRL+r9r+bJaANs7IXXADf1FRUh9s=;
	b=lkhQ2WwzGOGumMDDCiMp2lP3UK3pnVS578O+8UIxb9murrNTfguti1oj9uo9RrjXmy
	MFJEQYL2ouyUTfZgt5i2BWGay7OThvQLFqZZufrfghdihjyJqXOVWzg1NCcB5/+SFVDO
	fYdvExPKdqxdJMRgd5NjmbojJ0N5N5Pg5OBRA8DGLzF82mVaivt/2D8dk8RrtrjG2x6C
	S8oopOY1LKCbAN0yVIIhwK9nmWnQQWdBfaSqXj+Dp9xbkmFC8hwL9C99TS0xQroLw/hY
	QhZJ+m2oHBvfekU4IF1wkAouX/6c9pbXVrFLWbS3WU0r5T3yBTzXS6Zgs9RKnor7seEa
	DebQ==
X-Gm-Message-State: ALoCoQkjlUYT66tCzKNHTWqlgF90DnOnm4vTws7aCIyJakviuN5YRhR6BOg6Kl7PVXqhgFFP01sG
X-Received: by 10.42.130.74 with SMTP id u10mr4143686ics.61.1424877486653;
	Wed, 25 Feb 2015 07:18:06 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E43A.dip0.t-ipconnect.de. [93.232.228.58])
	by mx.google.com with ESMTPSA id n17sm11598793igi.2.2015.02.25.07.18.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Feb 2015 07:18:05 -0800 (PST)
Message-ID: <1424877482.14357.88.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 16:18:02 +0100
In-Reply-To: <1424875875-1061-1-git-send-email-patrick.ohly@intel.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<1424875875-1061-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 25 Feb 2015 15:18:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-25 at 06:51 -0800, Patrick Ohly wrote:
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 4f9f813..e305e8b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -199,10 +199,13 @@ python write_specfile () {
>  
>              # Treat all symlinks to directories as normal files.
>              # os.walk() lists them as directories.
> -            for i, entry in enumerate(dirs):
> -                if os.path.islink(os.path.join(rootpath, entry)):
> -                    del dirs[i]
> -                    files.append(entry)
> +            def move_to_files(dir):
> +                if os.path.islink(os.path.join(rootpath, dir)):
> +                    files.append(dir)
> +                    return True
> +                else:
> +                    return False
> +            dirs[:] = [dir for dir in dirs if not move_to_files(dir)]
>  
>              # Directory handling can happen in two ways, either DIRFILES is not set at all
>              # in which case we fall back to the older behaviour of packages owning all their

Please ignore. I meant to squash the original patch and the list fix,
but was interrupted and ended up committing the fix separately with the
updated commit message. v3 is the patch that could be merged into
master.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





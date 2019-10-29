Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 424327F99C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 08:18:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t16so12582108wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 01:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gN9ZFNR2KaMvVftdTrDZllVQ/VcbWME/B8I2mdxiuP4=;
	b=cg0psvhLsw6G1xLZltQ4TQssfIE4g5nD1iIMtMU9Se9LTbIUHZMdu5ZrcMOLC/UquX
	1FWgQbd9DVLvupeOa7bZhyPDPa3vovLqnMZXaFkQCxYjtz4F9NauliKdxu0Sqvcz45cP
	9fCIr4ntUQngKkEqmlMCVUsDIcPzeCHR1nfm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gN9ZFNR2KaMvVftdTrDZllVQ/VcbWME/B8I2mdxiuP4=;
	b=YcBABwDCLF2BEEafE4AKDesWW8OUQ/WN2Bbq8ZIZjYdgCLpK4XHmmYDhT7Qkme6CIG
	DdMqDSWPVq1staAQcGX16cRmcpa7XjK802JY4DNF/OzuWQyGhulldmXxM2FrqJRndqLw
	JYi30jBDsOUrtco4oF97IwPDqfxEF3na6hcAC0v5Wxxe0sbHaDfcNBElZq7MkuriJ1Q7
	saGMR/+udq5uVRgtV3T69/whiS9OFGKiPzHVn6j1QACHf+zEkfj0hVdnNkJ7+ZO1JmlW
	j7w2idZWESihXZGd3Gan8jFKgWmIBztw0F9tI/si5vZw3H30u3vrhqD1nHVJLKOE2tS9
	ZiBA==
X-Gm-Message-State: APjAAAVoy2HDuJn+niq6eJyb7IIE3T1ow24bVZbwHQUP+ZKOMK3V0sa5
	puejpVs0rrKdkB688yxHYk/s5g==
X-Google-Smtp-Source: APXvYqwrsf0z4yCQOYBg/4NUa8MRhfZtjNEPvzLZ2+qXqo8APkDM2JRZaeu0U5YX8v8Fv6b34z7hZA==
X-Received: by 2002:adf:8289:: with SMTP id 9mr19841920wrc.0.1572337119723;
	Tue, 29 Oct 2019 01:18:39 -0700 (PDT)
Received: from hex ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id r2sm2331876wma.1.2019.10.29.01.18.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 01:18:38 -0700 (PDT)
Message-ID: <100fd9d42893f3ea7683fb70281d0622f1896259.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 08:18:38 +0000
In-Reply-To: <beec8a52a8738b0a88cc81dc7898fa38b5088b68.1572072422.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
	<beec8a52a8738b0a88cc81dc7898fa38b5088b68.1572072422.git.akuster808@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [zeus 18/28] cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Tue, 29 Oct 2019 08:18:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-10-25 at 23:49 -0700, Armin Kuster wrote:
> From: Michael Ho <Michael.Ho@bmw.de>
> 
> The find_program command will fail if it is used on a tool that is
> listed in
> ASSUME_PROVIDED. This is because these tools are in the hosttools
> directory
> which is not listed in CMAKE_FIND_ROOT_PATH so cmake will not find
> them.
> 
> Adding the directory HOSTTOOLS_DIR to the CMAKE_FIND_ROOT_PATH
> variable fixes
> the initial issue of needing to search for tools in ASSUME_PROVIDED.
> 
> Note that this change alone does not fix the issue because
> find_program will
> by default only look into the subdirectories bin and usr/bin under
> the paths
> in CMAKE_FIND_ROOT_PATH to find the programs and the hosttools
> directory has
> instead the symlinks directly present without these subdirectories.
> 
> Set CMAKE_PROGRAM_PATH to by default include the root directory so
> find_program can search the hosttools directory without needing the
> prefix
> directories.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit 7847f431cd8db59fce8c9401a603c4b0678ee16d)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

Given the fallout in meta-oe, I don't plan to take this.

Cheers,

Richard


